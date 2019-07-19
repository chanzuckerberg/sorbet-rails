# typed: true
class ModelRbiFormatter
  MODEL_RELATION_SHARED_MODULE_SUFFIX = "ModelRelationShared"
  MODEL_CLASS_MODULE_SUFFIX = "ClassMethods"
  MODEL_INSTANCE_MODULE_SUFFIX = "InstanceMethods"

  def initialize(model_class, available_classes)
    @model_class = model_class
    @available_classes = available_classes
    @columns_hash = model_class.table_exists? ? model_class.columns_hash : {}
    @generated_instance_module_sigs = ActiveSupport::HashWithIndifferentAccess.new
    @generated_instance_sigs = ActiveSupport::HashWithIndifferentAccess.new
    @generated_class_sigs = ActiveSupport::HashWithIndifferentAccess.new
    @generated_scope_sigs = ActiveSupport::HashWithIndifferentAccess.new
    @generated_querying_sigs = ActiveSupport::HashWithIndifferentAccess.new
    @model_relation_class_name = "#{@model_class.name}::ActiveRecord_Relation"
    begin
      # Load all dynamic instance methods of this model by instantiating a fake model
      @model_class.new unless @model_class.abstract_class?
    rescue StandardError
      puts "Note: Unable to create new instance of #{model_class.name}"
    end
  end

  def generate_rbi
    puts "-- Generate sigs for #{@model_class.name} --"
    populate_activerecord_querying_methods
    populate_named_scope_methods
    populate_generated_column_methods
    populate_generated_association_methods
    populate_generated_enum_methods

    @buffer = []
    @buffer << draw_file_header_and_base_classes

    @buffer << draw_module_header("#{@model_class.name}::#{MODEL_INSTANCE_MODULE_SUFFIX}")
    @model_class.instance_methods.sort.each do |method_name|
      expected_sig = @generated_instance_module_sigs[method_name]
      next unless expected_sig.present?
      method_obj = @model_class.instance_method(method_name)
      draw_method(method_name, method_obj, expected_sig)
    end
    @buffer << draw_module_or_class_footer

    # TODO Enum methods need to be defined under the class definition because sorbet generates them
    # in the hidden-definition.rbi
    # When this issue is resolved, they might go away by running `srb rbi hidden-definitions`
    # This is a sure way to make it work though.
    # https://github.com/sorbet/sorbet/issues/1161
    @buffer << draw_class_header("#{@model_class.name}") # ::#{MODEL_CLASS_MODULE_SUFFIX}")
    @model_class.instance_methods.sort.each do |method_name|
      expected_sig = @generated_instance_sigs[method_name]
      next unless expected_sig.present?
      method_obj = @model_class.instance_method(method_name)
      draw_method(method_name, method_obj, expected_sig)
    end
    @model_class.methods.sort.each do |method_name|
      expected_sig = @generated_class_sigs[method_name]
      next unless expected_sig.present?
      method_obj = @model_class.method(method_name)
      draw_method(method_name, method_obj, expected_sig, is_class_method: true)
    end
    @buffer << draw_module_or_class_footer

    # <Model>::MODEL_RELATION_SHARED_MODULE_SUFFIX is a fake module added so that
    # when a method is defined in this module, it'll be added to both the Model class
    # as a class method and to its relation as an instance method.
    #
    # We need to define the module after the other classes
    # to work around Sorbet loading order bug
    # https://sorbet-ruby.slack.com/archives/CHN2L03NH/p1556065791047300
    @buffer << draw_module_header("#{@model_class.name}::#{MODEL_RELATION_SHARED_MODULE_SUFFIX}")
    # For simplicity, generate both in the same module for now.
    # We don't need to define two fake modules to share methods between <Model> and <Relation>
    ({}.
      merge(@generated_scope_sigs).
      merge(@generated_querying_sigs)
    ).each do |method_name, expected_sig|
      method_obj = @model_class.method(method_name) if @model_class.methods.include?(method_name.to_sym)
      # this is not a class method because it is added to a module
      draw_method(method_name, method_obj, expected_sig)
    end
    @buffer << draw_module_or_class_footer
    @buffer.join("\n")
  end

  def draw_method(method_name, method_obj, expected_sig, is_class_method: false)
    if !method_obj.present?
      # not very actionable because this could be a method in a newer version of Rails
      # puts "Skip method '#{method_name}' because there is no matching method object."
      return
    end
    @buffer << generate_method_sig(method_name, expected_sig, is_class_method).indent(2)
  end

  def populate_activerecord_querying_methods
    # All is a named scope that most method from ActiveRecord::Querying delegate to
    # rails/activerecord/lib/active_record/querying.rb:21
    @generated_scope_sigs["all"] = { ret: @model_relation_class_name }
    @generated_scope_sigs["unscoped"] = {
      ret: @model_relation_class_name,
      args: [
        { name: :block, arg_type: :block, value_type: 'T.nilable(T.proc.void)' },
      ]
    }
    # It's not possible to typedef all methods in ActiveRecord::Querying module to have the
    # matching type. By generating model-specific sig, we can typedef these methods to return
    # <Model>::Relation class.
    # rails/activerecord/lib/active_record/querying.rb
    model_query_relation_methods = [
      :select, :reselect, :order, :reorder, :group, :limit, :offset, :joins, :left_joins, :left_outer_joins,
      :where, :rewhere, :preload, :extract_associated, :eager_load, :includes, :from, :lock, :readonly, :extending, :or,
      :having, :create_with, :distinct, :references, :none, :unscope, :optimizer_hints, :merge, :except, :only,
    ]
    model_query_relation_methods.each do |method_name|
      @generated_querying_sigs[method_name.to_s] = {
        args: [
          {name: :args, arg_type: :rest, value_type: 'T.untyped'},
          {name: :block, arg_type: :block, value_type: 'T.nilable(T.proc.void)'},
        ],
        ret: @model_relation_class_name,
      }
    end
  end

  def populate_named_scope_methods
    @model_class.methods.sort.each do |method_name|
      method_obj = @model_class.method(method_name)
      next unless method_obj.present? && method_obj.source_location.present?
      # we detect sscopes defined in a model by 2 criteria:
      # - they don't have an owner name
      # - they are defined in 'activerecord/lib/active_record/scoping/named.rb'
      # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/scoping/named.rb
      next unless method_obj.owner.name == nil
      source_file = method_obj.source_location[0]
      next unless source_file.include?('lib/active_record/scoping/named.rb')
      @generated_scope_sigs[method_name] = {
        args: [ name: :args, arg_type: :rest, value_type: 'T.untyped' ],
        ret: @model_relation_class_name,
      }
    end
  end

  def populate_generated_column_methods
    @columns_hash.each do |column_name, column_def|
      if @model_class.defined_enums.has_key?(column_name)
        # enum attribute is treated differently
        assignable_type = "T.any(Integer, String, Symbol)"
        assignable_type = "T.nilable(#{assignable_type})" if column_def.null
        @generated_instance_module_sigs.merge!({
          "#{column_name}" => { ret: "String" },
          "#{column_name}=" => {
            args: [ name: :value, arg_type: :req, value_type: assignable_type],
          },
        })
      else
        column_type = type_for_column_def(column_def)
        @generated_instance_module_sigs.merge!({
          "#{column_name}" => { ret: column_type },
          "#{column_name}=" => {
            args: [ name: :value, arg_type: :req, value_type: column_type ],
          },
        })
      end

      @generated_instance_module_sigs["#{column_name}?"] = {
        ret: "T::Boolean",
        args: [ name: :args, arg_type: :rest, value_type: 'T.untyped' ],
      }
    end
  end

  def populate_generated_association_methods
    @model_class.reflections.each do |assoc_name, reflection|
      reflection.collection? ?
        populate_collection_assoc_getter_setter(assoc_name, reflection) :
        populate_single_assoc_getter_setter(assoc_name, reflection)
    end
  end

  def populate_single_assoc_getter_setter(assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    assoc_type = "T.nilable(#{assoc_class})"
    if reflection.belongs_to?
      # if this is a belongs_to connection, we may be able to detect whether
      # this field is required & use a stronger type
      column_def = @columns_hash[reflection.foreign_key.to_s]
      if column_def
        assoc_type = assoc_class if !column_def.null
      end
    end

    @generated_instance_sigs.merge!({
      "#{assoc_name}" => { ret: assoc_type },
      "#{assoc_name}=" => {
        args: [ name: :value, arg_type: :req, value_type: assoc_type ],
      },
    })
  end

  def populate_collection_assoc_getter_setter(assoc_name, reflection)
    # TODO allow people to specify the possible values of polymorphic associations
    assoc_class = assoc_should_be_untyped?(reflection) ? "T.untyped" : "::#{reflection.klass.name}"
    relation_class = relation_should_be_untyped?(reflection) ?
      "ActiveRecord::Associations::CollectionProxy" :
      "#{assoc_class}::ActiveRecord_Associations_CollectionProxy"
    @generated_instance_sigs.merge!({
      "#{assoc_name}" => { ret: relation_class },
      "#{assoc_name}=" => {
        args: [ name: :value, arg_type: :req, value_type: "T.any(T::Array[#{assoc_class}], #{relation_class})" ],
      },
    })
  end

  def populate_generated_enum_methods
    @model_class.defined_enums.each do |enum_name, enum_hash|
      @generated_class_sigs["#{enum_name.pluralize}"] = { ret: "T::Hash[T.any(String, Symbol), Integer]"}
      enum_hash.keys.each do |enum_val|
        @generated_instance_module_sigs["#{enum_val}?"] = { ret: "T::Boolean" }
        @generated_instance_module_sigs["#{enum_val}!"] = { ret: nil }
        @generated_scope_sigs["#{enum_val}"] = {
          args: [ name: :args, arg_type: :rest, value_type: 'T.untyped' ],
          ret: @model_relation_class_name,
        }
        # force generating these methods because sorbet's hidden-definitions generate & override them
        @generated_class_sigs["#{enum_val}"] = {
          args: [ name: :args, arg_type: :rest, value_type: 'T.untyped' ],
          ret: @model_relation_class_name,
        }
      end
    end
  end

  def assoc_should_be_untyped?(reflection)
    polymorphic_assoc?(reflection) || !@available_classes.include?(reflection.klass.name)
  end

  def relation_should_be_untyped?(reflection)
    # only type the relation we'll generate
    assoc_should_be_untyped?(reflection) || !@available_classes.include?(reflection.klass.name)
  end

  def polymorphic_assoc?(reflection)
    reflection.through_reflection ?
      polymorphic_assoc?(reflection.source_reflection) :
      reflection.polymorphic?
  end

  def draw_file_header_and_base_classes
    # We define a custom <ModelName>::Relation class so that it can be extended
    # to contain custom scopes for each models
    <<~MESSAGE
      # This is an autogenerated file for dynamic methods in #{@model_class.name}
      # Please rerun rake rails_rbi:models to regenerate.
      # typed: strong

      class #{@model_relation_class_name} < ActiveRecord::Relation
        include #{@model_class.name}::#{MODEL_RELATION_SHARED_MODULE_SUFFIX}
        extend T::Generic
        Elem = type_member(fixed: #{@model_class.name})
      end

      class #{@model_class.name}::ActiveRecord_Associations_CollectionProxy < ActiveRecord::Associations::CollectionProxy
        include #{@model_class.name}::#{MODEL_RELATION_SHARED_MODULE_SUFFIX}
        extend T::Generic
        Elem = type_member(fixed: #{@model_class.name})
      end

      class #{@model_class.name} < #{@model_class.superclass}
        extend T::Sig
        extend T::Generic
        extend #{@model_class.name}::#{MODEL_RELATION_SHARED_MODULE_SUFFIX}
        include #{@model_class.name}::#{MODEL_INSTANCE_MODULE_SUFFIX}
        Elem = type_template(fixed: #{@model_class.name})
      end
    MESSAGE
  end

  def draw_module_or_class_footer
    <<~MESSAGE
      end
    MESSAGE
  end

  def draw_module_header(name)
    <<~MESSAGE
      module #{name}
        extend T::Sig
    MESSAGE
  end

  def draw_class_header(name)
    <<~MESSAGE
      class #{name}
        extend T::Sig
    MESSAGE
  end

  def type_for_column_def(column_def)
    cast_type = ActiveRecord::Base.connection.respond_to?(:lookup_cast_type_from_column) ?
      ActiveRecord::Base.connection.lookup_cast_type_from_column(column_def) :
      column_def.cast_type

    strict_type = active_record_type_to_sorbet_type(cast_type)

    if column_def.respond_to?(:array?) && column_def.array?
      strict_type = "T::Array[#{strict_type}]"
    end
    column_def.null ? "T.nilable(#{strict_type})" : strict_type
  end

  def active_record_type_to_sorbet_type(klass)
    case klass
    when ActiveRecord::Type::Boolean
     "T::Boolean"
    when ActiveRecord::Type::DateTime
      DateTime
    when ActiveRecord::Type::Date
      Date
    when ActiveRecord::Type::Decimal
      BigDecimal
    when ActiveRecord::Type::Float
      Float
    when ActiveRecord::Type::Time
      Time
    when ActiveRecord::Type::BigInteger, ActiveRecord::Type::Integer, ActiveRecord::Type::DecimalWithoutScale, ActiveRecord::Type::UnsignedInteger
      Integer
    when ActiveRecord::Type::Binary, ActiveRecord::Type::String, ActiveRecord::Type::Text
      String
    else
      # Json type is only supported in Rails 5.2 and above
      case
      when Object.const_defined?('ActiveRecord::Type::Json') && klass.is_a?(ActiveRecord::Type::Json)
        "T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String)"
      when Object.const_defined?('ActiveRecord::Enum::EnumType') && klass.is_a?(ActiveRecord::Enum::EnumType)
        String
      else
        "T.untyped"
      end
    end
  end

  def generate_method_sig(method_name, generated_method_def, is_class_method)
    # generated_method_def:
    # {
    # .  ret: <return_type>
    #    args: [ name: :value, arg_type: :req, value_type: "T.any(T::Array[#{assoc_class}], ActiveRecord::Relation" ]
    #  }
    #
    # Generate something like this
    #
    #  sig {returns(T.nilable(String))}
    # .def email; end
    #  sig {params(record: T.nilable(String)).void}
    #  def email=(record); end

    param_sig = ""
    param_def = ""
    if generated_method_def[:args]
      sig_args_string = generated_method_def[:args].map { |arg_def|
        "#{arg_def[:name]}: #{arg_def[:value_type]}"
      }.join(", ")
      param_sig = "params(#{sig_args_string})."

      param_def = generated_method_def[:args].map { |arg_def|
        prefix = ""
        prefix = "*" if arg_def[:arg_type] == :rest
        prefix = "**" if arg_def[:arg_type] == :keyrest
        prefix = "&" if arg_def[:arg_type] == :block

        "#{prefix}#{arg_def[:name]}"
      }.join(", ")
    end

    method_prefix = is_class_method ? 'self.' : ''

    return_type = generated_method_def[:ret] ?
      "returns(#{generated_method_def[:ret]})" :
      "void"

    <<~MESSAGE
      sig { #{param_sig}#{return_type} }
      def #{method_prefix}#{method_name}(#{param_def}); end
    MESSAGE
  end
end
