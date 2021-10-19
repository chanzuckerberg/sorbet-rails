# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::CustomFinderMethods < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)
    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)
    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)

    custom_module_name = self.model_module_name("CustomFinderMethods")
    custom_module_rbi = root.create_module(custom_module_name)

    # and include the rbi module
    model_class_rbi.create_extend(custom_module_name)
    model_relation_class_rbi.create_include(custom_module_name)
    model_assoc_proxy_class_rbi.create_include(custom_module_name)
    model_assoc_relation_rbi.create_include(custom_module_name)

    custom_module_rbi.create_method(
      "first_n",
      parameters: [ Parameter.new("limit", type: "Integer") ],
      return_type: "T::Array[#{self.model_class_name}]",
    )

    custom_module_rbi.create_method(
      "last_n",
      parameters: [ Parameter.new("limit", type: "Integer") ],
      return_type: "T::Array[#{self.model_class_name}]",
    )

    custom_module_rbi.create_method(
      "find_n",
      parameters: [ Parameter.new("*args", type: "T::Array[T.any(Integer, String)]") ],
      return_type: "T::Array[#{self.model_class_name}]",
    )

    # allow common cases find_by_id
    custom_module_rbi.create_method(
      "find_by_id",
      parameters: [ Parameter.new("id", type: "T.nilable(Integer)") ],
      return_type: "T.nilable(#{self.model_class_name})",
    )
    custom_module_rbi.create_method(
      "find_by_id!",
      parameters: [ Parameter.new("id", type: "Integer") ],
      return_type: self.model_class_name,
    )
  end
end
