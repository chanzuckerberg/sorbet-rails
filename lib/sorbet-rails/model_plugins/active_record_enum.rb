# typed: strict
require ('sorbet-rails/model_plugins/base')
require("sorbet-rails/utils")
class SorbetRails::ModelPlugins::ActiveRecordEnum < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless model_class.defined_enums.size > 0

    enum_module_name = model_module_name("EnumInstanceMethods")
    enum_module_rbi = root.create_module(enum_module_name)

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(enum_module_name)

    # TODO: add any method for signature verification?
    model_class.defined_enums.sort.each do |enum_name, enum_hash|
      value_type = enum_hash.values.map { |v| v.is_a?(Integer) ? 'Integer' : v.class.name }.uniq

      return_type = if value_type.length == 1
        "T::Hash[T.any(String, Symbol), #{value_type.first}]"
      else
        "T::Hash[T.any(String, Symbol), T.any(#{value_type.join(", ")})]"
      end

      model_class_rbi.create_method(
        enum_name.pluralize,
        return_type: return_type,
        class_method: true,
      )

      enum_call = ActiveRecordOverrides.instance.get_enum_call(@model_class, enum_name.to_sym)
      if enum_call.nil?
        puts "Error: unable to find enum call for enum #{enum_name}, model #{self.model_class_name}"
        next
      end

      enum_prefix = enum_call[:_prefix]
      prefix =
        if enum_prefix == true
          "#{enum_name}_"
        elsif enum_prefix
          "#{enum_prefix}_"
        else
          ''
        end
      enum_suffix = enum_call[:_suffix]
      suffix =
        if enum_suffix == true
          "_#{enum_name}"
        elsif enum_suffix
          "_#{enum_suffix}"
        else
          ''
        end

      enum_hash.keys.each do |enum_val|
        next unless SorbetRails::Utils.valid_method_name?(enum_val.to_s)
        enum_module_rbi.create_method(
          "#{prefix}#{enum_val}#{suffix}?",
          return_type: "T::Boolean",
        )
        enum_module_rbi.create_method(
          "#{prefix}#{enum_val}#{suffix}!",
          return_type: nil, # void
        )
      end
    end
  end
end
