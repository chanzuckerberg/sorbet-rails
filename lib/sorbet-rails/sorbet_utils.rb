# typed: false

require('parlour')
require('sorbet-runtime')

module SorbetRails::SorbetUtils
  extend T::Sig

  sig { params(method_def: UnboundMethod).returns(T::Array[Parlour::RbiGenerator::Parameter]) }
  def self.parameters_from_method_def(method_def)
    signature = T::Private::Methods.signature_for_method(method_def)

    parameters_with_type = signature.nil? ?
      method_def.parameters.map { |p| p + ['T.untyped'] } : # append untyped to each
      get_ordered_parameters_with_type(signature)

    parameters_with_type.map do |param_def|
      param_name = param_def[1]
      prefix =
        case param_def[0]
        when :rest; '*'
        when :keyrest; '**'
        when :block; '&'
        # being comprehensive
        when :req, :opt; ''
        when :key, :keyreq; ''
        else ''
        end

      param_type = param_def[2].to_s
      if param_def[0] == :block
        # special case `.void` in a proc
        # see https://github.com/sorbet/sorbet/blob/master/gems/sorbet-runtime/lib/types/types/proc.rb#L10
        param_type = param_type.gsub('returns(<VOID>)', 'void')
      end

      ::Parlour::RbiGenerator::Parameter.new("#{prefix}#{param_name}", type: param_type)
    end
  end

  sig {
    params(signature: T::Private::Methods::Signature).
    returns(T::Array[[Symbol, Symbol, T::Types::Base]])
  }
  def self.get_ordered_parameters_with_type(signature)
    # extract original method param from signature
    # https://github.com/sorbet/sorbet/blob/master/gems/sorbet-runtime/lib/types/private/methods/signature.rb#L5-L8
    params = []
    signature.arg_types.each do |arg_type|
      # could be :opt, but doesn't matter
      params << [:req, arg_type[0], arg_type[1]]
    end
    signature.req_kwarg_names.each do |kwarg_name|
      # could be :key, but doesn't matter
      params << [:keyreq, kwarg_name, signature.kwarg_types[kwarg_name]]
    end
    if signature.has_rest
      params << [:rest, signature.rest_name, signature.rest_type]
    end
    if signature.has_keyrest
      params << [:keyrest, signature.keyrest_name, signature.keyrest_type]
    end
    if !signature.block_name.nil?
      params << [:block, signature.block_name, signature.block_type]
    end
    params
  end
end
