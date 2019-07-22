require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordEnum < SorbetRails::ModelPlugins::Base
  def generate(root)
    return unless model_class.defined_enums.size > 0

    byebug
    model_relation_class_name = model_relation_class_name
    instance_module_name = model_module_name("EnumInstanceMethods")

    model_class_rbi = root.create_class(name: model_class_name)
    model_relation_shared_rbi = root.create_module(name: model_relation_shared_module_name)

    instance_module_rbi = root.create_module(name: instance_module_name)
    model_class_rbi.create_include(name: instance_module_name)

    # TODO: add any method for signature verification?
    model_class.defined_enums.each do |enum_name, enum_hash|
      model_class_rbi.create_method(
        name: "#{enum_name.pluralize}",
        return_type: "T::Hash[T.any(String, Symbol), Integer]",
      )
      enum_hash.keys.each do |enum_val|
        instance_module_rbi.create_method(
          name: "#{enum_val}?",
          return_type: "T::Boolean",
        )
        instance_module_rbi.create_method(
          name: "#{enum_val}!",
          return_type: nil, # void
        )
        model_relation_shared_rbi.create_method(
          name: "#{enum_val}",
          parameters: [
            Parameter.new(name: "*args", type: "T.untyped")
          ],
          return_type: model_relation_class_name,
        )
        # force generating these methods because sorbet's hidden-definitions generate & override them
        model_class_rbi.create_method(
          name: "#{enum_val}",
          parameters: [
            Parameter.new(name: "*args", type: "T.untyped")
          ],
          return_type: model_relation_class_name,
        )
      end
    end
  end
end
