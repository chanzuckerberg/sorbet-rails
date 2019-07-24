require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordEnum < SorbetRails::ModelPlugins::Base
  def generate(root)
    return unless model_class.defined_enums.size > 0

    enum_module_name = model_module_name("EnumInstanceMethods")
    enum_module_rbi = root.create_module(name: enum_module_name)
    enum_module_rbi.create_extend(name: "T::Sig")

    model_class_rbi = root.create_class(name: self.model_class_name)
    model_class_rbi.create_include(name: enum_module_name)

    model_relation_shared_rbi = root.create_module(name: self.model_relation_shared_module_name)

    # TODO: add any method for signature verification?
    model_class.defined_enums.sort.each do |enum_name, enum_hash|
      model_class_rbi.create_method(
        name: enum_name.pluralize,
        return_type: "T::Hash[T.any(String, Symbol), Integer]",
        class_method: true,
      )
      enum_hash.keys.each do |enum_val|
        enum_module_rbi.create_method(
          name: "#{enum_val}?",
          return_type: "T::Boolean",
        )
        enum_module_rbi.create_method(
          name: "#{enum_val}!",
          return_type: nil, # void
        )
        # force generating these methods because sorbet's hidden-definitions generate & override them
        model_class_rbi.create_method(
          name: "#{enum_val}",
          return_type: self.model_relation_class_name,
          class_method: true,
        )
      end
    end
  end
end
