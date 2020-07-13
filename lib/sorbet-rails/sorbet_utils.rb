# typed: false

require('parlour')
require('sorbet-runtime')
require('method_source')
require('parser/current')

module SorbetRails
  module SorbetUtils
    extend T::Sig
    include Kernel

    class ParsedParamDef < T::Struct
      const :name, Symbol
      const :kind, Symbol
      const :type_str, String
      prop :default, T.nilable(String), default: nil
      prop :prefix, T.nilable(String)
      prop :suffix, T.nilable(String)
    end

    sig { params(method_def: UnboundMethod).returns(T::Array[Parlour::RbiGenerator::Parameter]) }
    def self.parameters_from_method_def(method_def)
      signature = T::Private::Methods.signature_for_method(method_def)
      method_def = signature.nil? ? method_def : signature.method

      parameters_with_type = signature.nil? ?
        method_def.parameters.map { |p|
          ParsedParamDef.new(
            name: p.size == 1 ? :_ : p[1],  # give param without name default name _
            kind: p[0], # append untyped as type of each param
            type_str: 'T.untyped',
          )
        } :
        get_ordered_parameters_with_type(signature)

      # add prefix & suffix
      parameters_with_type.each do |param_def|
        param_def.prefix =
          case param_def.kind
          when :rest; '*'
          when :keyrest; '**'
          when :block; '&'
          # being comprehensive
          when :req, :opt; ''
          when :key, :keyreq; ''
          else nil
          end

        param_def.suffix =
          case param_def.kind
          when :key, :keyreq; ':'
          else nil
          end
      end

      extract_default_value_for_params!(
        parameters_with_type,
        method_def,
      )

      parameters_with_type.map do |param_def|
        ::Parlour::RbiGenerator::Parameter.new(
          "#{param_def.prefix}#{param_def.name}#{param_def.suffix}",
          type: param_def.type_str,
          default: param_def.default,
        )
      end
    end

    sig {
      params(signature: T::Private::Methods::Signature).
      returns(T::Array[ParsedParamDef])
    }
    def self.get_ordered_parameters_with_type(signature)
      # extract original method param from signature
      # https://github.com/sorbet/sorbet/blob/master/gems/sorbet-runtime/lib/types/private/methods/signature.rb#L5-L8
      params = T.let([], T::Array[ParsedParamDef])
      signature.arg_types.each do |arg_type|
        # could be :opt, but doesn't matter
        params << ParsedParamDef.new(
          name: arg_type[0],
          kind: :req,
          type_str: arg_type[1].to_s,
        )
      end
      signature.kwarg_types.each do |kwarg_name, kwarg_type|
        # could be :key, but doesn't matter
        params << ParsedParamDef.new(
          name: kwarg_name,
          kind: :keyreq,
          type_str: kwarg_type.to_s,
        )
      end
      if signature.has_rest
        params << ParsedParamDef.new(
          name: signature.rest_name,
          kind: :rest,
          type_str: signature.rest_type.to_s,
        )
      end
      if signature.has_keyrest
        params << ParsedParamDef.new(
          name: signature.keyrest_name,
          kind: :keyrest,
          type_str: signature.keyrest_type.to_s,
        )
      end
      if !signature.block_name.nil?
        # special case `.void` in a proc
        # see https://github.com/sorbet/sorbet/blob/master/gems/sorbet-runtime/lib/types/types/proc.rb#L10
        block_param_type = signature.block_type.to_s
        block_param_type = block_param_type.gsub('returns(<VOID>)', 'void')
        params << ParsedParamDef.new(
          name: signature.block_name,
          kind: :block,
          type_str: block_param_type,
        )
      end
      params
    end

    sig {
      params(
        parsed_params: T::Array[ParsedParamDef],
        method_def: UnboundMethod,
      ).void
    }
    def self.extract_default_value_for_params!(parsed_params, method_def)
      source = method_def.source
      parsed_ast = Parser::CurrentRuby.parse(source)
      if parsed_ast.type != :def
        # could be a method added at runtime? ignore it
        puts "Warning: unable to parse the source of #{method_def.name}"
        return
      end

      args = parsed_ast.children[1]
      if args.type != :args
        puts "Warning: unable to parse the source of #{method_def.name}"
        return
      end

      parsed_params_map = Hash[parsed_params.map {|p| [p.name, p]}]
      args.children.each do |arg|
        arg_name = arg.children[0]
        default = arg.children[1] ? node_to_s(arg.children[1]) : nil

        next if arg_name.blank?

        param_def = parsed_params_map[arg_name]

        raise UnexpectedParam.new(
          "Unexpected param #{arg_name} when parsing #{method_def.name}"
        ) unless param_def.present?

        param_def.default = default
      end
    end

    # Given an AST node, returns the source code from which it was constructed.
    # If the given AST node is nil, this returns nil.
    # Taken from https://github.com/AaronC81/parlour/blob/master/lib/parlour/type_parser.rb#L506
    sig { params(node: T.nilable(Parser::AST::Node)).returns(T.nilable(String)) }
    def self.node_to_s(node)
      return nil unless node

      exp = node.loc.expression
      exp.source_buffer.source[exp.begin_pos...exp.end_pos]
    end

    class UnexpectedParam < StandardError; end
  end
end
