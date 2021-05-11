# typed: false
class FlagShihTzuPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::FlagShihTzu)

    obj_custom_module_name = self.model_module_name("GeneratedFlagShihTzuMethods")
    obj_custom_module_rbi  = root.create_module(obj_custom_module_name)

    klass_custom_module_name = self.model_module_name("GeneratedFlagShihTzuClassMethods")
    klass_custom_module_rbi  = root.create_module(klass_custom_module_name)


    # here we re-create the model class!
    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(obj_custom_module_name)
    model_class_rbi.create_extend(klass_custom_module_name)

    # then create custom methods, constants, etc. for this module.
    add_class_methods(klass_custom_module_rbi)

    if @model_class.flag_columns.present?
      @model_class
        .flag_columns
        .each do |column|
          add_methods_for_column(column, obj_custom_module_rbi)
        end
    end

    if @model_class.flag_mapping.present?
      @model_class
        .flag_mapping
        .each do |column, flags|
          flags.keys
            .select { |flag_key| really_has_the_flag?(flag_key) }
            .each do |flag_key|
              add_methods_for_flag(column, flag_key, obj_custom_module_rbi)
            end
        end
    end
  end

  private

  sig { params(custom_module_rbi: Parlour::RbiGenerator::ModuleNamespace).void }
  def add_class_methods(custom_module_rbi)
    # https://github.com/pboling/flag_shih_tzu/blob/6a3f1c5f62bd56aa932252eef935826c9674b096/lib/flag_shih_tzu.rb#L12
    custom_module_rbi.create_method(
      'flag_options',
      returns: 'T::Hash[String, T::Hash[Symbol, T.untyped]]'
    )

    # https://github.com/pboling/flag_shih_tzu/blob/6a3f1c5f62bd56aa932252eef935826c9674b096/lib/flag_shih_tzu.rb#L13
    custom_module_rbi.create_method(
      'flag_mapping',
      returns: 'T::Hash[String, T::Hash[Symbol, Integer]]'
    )

    # https://github.com/pboling/flag_shih_tzu/blob/6a3f1c5f62bd56aa932252eef935826c9674b096/lib/flag_shih_tzu.rb#L14
    custom_module_rbi.create_method(
      'flag_columns',
      returns: 'T::Array[Symbol]'
    )

    # https://github.com/pboling/flag_shih_tzu#updating-flag-column-by-raw-sql
    custom_module_rbi.create_method(
      'set_flag_sql',
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'flag',
          type: 'Symbol'
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          'value',
          type: 'T::Boolean'
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          'colmn',
          type: 'T.nilable(String)'
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          'custom_table_name',
          type: 'T.any(String, Symbol)'
        )
      ],
      returns: 'T::Hash[String, T::Hash[Symbol, T.untyped]]'
    )

    if @model_class.flag_mapping.present?
      # https://github.com/pboling/flag_shih_tzu#support-for-manually-building-conditions
      @model_class
        .flag_mapping
        .flat_map { |_, flags| flags.keys }
        .each do |flag_key|
          next unless really_has_the_flag?(flag_key)

          custom_module_rbi.create_method(
            "#{flag_key}_condition",
            parameters: [
              ::Parlour::RbiGenerator::Parameter.new(
                'options',
                type: 'T.nilable(T::Hash[Symbol, T.untyped])'
              )
            ],
            returns: 'String'
          )

          custom_module_rbi.create_method(
            "not_#{flag_key}_condition",
            parameters: [
              ::Parlour::RbiGenerator::Parameter.new(
                'options',
                type: 'T.nilable(T::Hash[Symbol, T.untyped])'
              )
            ],
            returns: 'String'
          )
        end
    end
  end

  # https://github.com/pboling/flag_shih_tzu#generated-boolean-patterned-instance-methods
  sig { params(column: String, custom_module_rbi: Parlour::RbiGenerator::ModuleNamespace).void }
  def add_methods_for_column(column, custom_module_rbi)
    custom_module_rbi.create_method(
      "all_#{column}",
      returns: 'T::Array[Symbol]'
    )

    custom_module_rbi.create_method(
      "selected_#{column}",
      returns: 'T::Array[Symbol]'
    )

    custom_module_rbi.create_method(
      "select_all_#{column}",
      returns: 'T::Array[Symbol]'
    )

    custom_module_rbi.create_method(
      "unselect_all_#{column}",
      returns: 'T::Array[Symbol]'
    )

    custom_module_rbi.create_method(
      "selected_#{column}=",
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'chosen_flags',
          type: 'T.nilable(T::Array[Symbol])'
        )
      ],
      returns: 'T::Array[Symbol]'
    )

  end

  # https://github.com/pboling/flag_shih_tzu#generated-boolean-patterned-instance-methods
  sig { params(column: String, flag_key: Symbol, custom_module_rbi: Parlour::RbiGenerator::ModuleNamespace).void }
  def add_methods_for_flag(column, flag_key, custom_module_rbi)
    custom_module_rbi.create_method(flag_key.to_s, returns: 'T::Boolean')
    custom_module_rbi.create_method("#{flag_key}?", returns: 'T::Boolean')
    custom_module_rbi.create_method(
      "#{flag_key}=",
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'value',
          type: 'T::Boolean'
        )
      ],
      returns: 'T::Boolean'
    )

    custom_module_rbi.create_method("not_#{flag_key}", returns: 'T::Boolean')
    custom_module_rbi.create_method("not_#{flag_key}?", returns: 'T::Boolean')
    custom_module_rbi.create_method(
      "not_#{flag_key}=",
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          'value',
          type: 'T::Boolean'
        )
      ],
      returns: 'T::Boolean'
    )

    custom_module_rbi.create_method("#{flag_key}_changed?", returns: 'T::Boolean')

    custom_module_rbi.create_method("has_#{flag_key}?", returns: 'T::Boolean')

    if @model_class.flag_options[column][:bang_methods]
      custom_module_rbi.create_method("#{flag_key}!", returns: 'T::Boolean')
      custom_module_rbi.create_method("not_#{flag_key}!", returns: 'T::Boolean')
    end
  end

  sig { params(flag_name: Symbol).returns(T::Boolean) }
  def really_has_the_flag?(flag_name)
    @model_class.respond_to?("#{flag_name}_condition")
  end
end
