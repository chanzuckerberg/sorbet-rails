# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordSerializedAttribute < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    columns_hash = @model_class.table_exists? ? @model_class.columns_hash : {}
    return unless any_serialized_columns?(columns_hash)

    serialize_module_name = self.model_module_name('GeneratedSerializedAttributeMethods')
    serialize_module_rbi = root.create_module(serialize_module_name)

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(serialize_module_name)

    columns_hash.sort.each do |column_name, column_def|
      serialization_coder = serialization_coder_for_column(column_name)
      next unless serialization_coder

      nilable = nilable_column?(column_def)
      attr_type = attr_types_for_coder(serialization_coder)

      serialize_module_rbi.create_method(
        column_name.to_s,
        return_type: ColumnType.new(base_type: attr_type, nilable: nilable).to_s,
      )

      serialize_module_rbi.create_method(
        "#{column_name}=",
        parameters: [
          Parameter.new('value', type: ColumnType.new(base_type: attr_type, nilable: nilable).to_s)
        ],
        return_type: nil,
      )

      serialize_module_rbi.create_method(
        "#{column_name}?",
        return_type: 'T::Boolean',
      )
    end
  end

  sig { params(columns_hash: T::Hash[String, ActiveRecord::ConnectionAdapters::Column]).returns(T::Boolean) }
  def any_serialized_columns?(columns_hash)
    columns_hash.keys.any? do |column_name|
      !serialization_coder_for_column(column_name).nil?
    end
  end

  sig { params(serialization_coder: T.nilable(Class)).returns(String) }
  def attr_types_for_coder(serialization_coder)
    case serialization_coder.to_s
    when 'Hash'
      # Hash uses YAML.load/YAML.dump, and permits pretty much any kind of Hash key
      'T::Hash[T.untyped, T.untyped]'
    when 'Array'
      # YAML.load/YAML.dump
      'T::Array[T.untyped]'
    when 'JSON'
      # ActiveSupport::JSON.encode/ActiveSupport::JSON.decode
      # note that Hash keys are Strings since this is JSON
      'T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[String, T.untyped], Integer, String)'
    when 'Object', ''
      'T.any(T::Array[T.untyped], T::Boolean, Float, T::Hash[T.untyped, T.untyped], Integer, String)'
    else
      serialization_coder.to_s
    end
  end
end
