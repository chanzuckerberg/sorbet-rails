# typed: strict
require('parlour')
require('sorbet-rails/model_utils')
module SorbetRails::ModelPlugins
  class Base < ::Parlour::Plugin
    extend T::Sig
    extend T::Helpers
    include SorbetRails::ModelUtils

    abstract!

    # convenient rename
    Parameter = ::Parlour::RbiGenerator::Parameter

    sig { override.returns(T.class_of(ActiveRecord::Base)) }
    attr_reader :model_class

    sig { returns(T::Set[String]) }
    attr_reader :available_classes

    sig {
      params(
        model_class: T.class_of(ActiveRecord::Base),
        available_classes: T::Set[String],
      ).
      void
    }
    def initialize(model_class, available_classes)
      @model_class = T.let(model_class, T.class_of(ActiveRecord::Base))
      @available_classes = T.let(available_classes, T::Set[String])
    end

    private

    sig { params(column_name: String).returns(T.nilable(Class)) }
    def serialization_coder_for_column(column_name)
      column_type = @model_class.type_for_attribute(column_name)
      return unless column_type.is_a?(ActiveRecord::Type::Serialized)

      object_class = column_type.coder.try(:object_class)
      if object_class
        object_class
      elsif column_type.coder.is_a? Class
        column_type.coder
      else
        Object
      end
    end

    sig {
      params(column_names: T::Array[String], aliases: T::Hash[String, String])
        .returns(T::Hash[String, T::Array[String]])
    }
    def model_class_columns_to_aliases(column_names, aliases)
      column_names.each_with_object({}) do |column_name, columns_to_aliases|
        direct_aliases = aliases.select do |_alias_name, attribute_name|
          attribute_name == column_name
        end.keys
        all_aliases = direct_aliases.flat_map do |direct_alias_name|
          recursive_keys_for_value(aliases, direct_alias_name).push(direct_alias_name)
        end

        columns_to_aliases[column_name] = all_aliases unless all_aliases.empty?
      end
    end

    sig { params(hash: T::Hash[String, String], initial_value: String).returns(T::Array[String]) }
    def recursive_keys_for_value(hash, initial_value)
      initial_keys = hash.select { |_key, value| value == initial_value }.keys
      initial_keys.flat_map { |key| [key].concat(recursive_keys_for_value(hash, key)) }
    end

    sig {
      params(
        columns_hash: T::Hash[String, T.untyped],
        aliases_hash: T::Hash[String, T::Array[String]],
      ).returns(T::Hash[String, T.untyped])
    }
    def model_class_attributes_and_aliases(columns_hash, aliases_hash)
      columns_hash
        .each_with_object({}) do |(column_name, column_def), attributes_and_aliases|
          [column_name].concat(aliases_hash[column_name] || []).each do |attribute_name|
            attributes_and_aliases[attribute_name] = column_def
          end
        end
    end
  end
end
