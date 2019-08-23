# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordEnum < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless model_class.defined_enums.size > 0

    enum_module_name = model_module_name("EnumInstanceMethods")
    enum_module_rbi = root.create_module(enum_module_name)
    enum_module_rbi.create_extend("T::Sig")

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(enum_module_name)

    # TODO: add any method for signature verification?
    model_class.defined_enums.sort.each do |enum_name, enum_hash|
      value_type = enum_hash.values.map(&:class).map(&:to_s).uniq
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
      enum_hash.keys.each do |enum_val|
        enum_module_rbi.create_method(
          "#{enum_val}?",
          return_type: "T::Boolean",
        )
        enum_module_rbi.create_method(
          "#{enum_val}!",
          return_type: nil, # void
        )
      end
    end
  end
end
