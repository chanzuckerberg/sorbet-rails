# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::CustomFinderMethods < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include("SorbetRails::CustomFinderMethods") # include the actual module

    custom_module_name = self.model_module_name("CustomFinderMethods")
    custom_module_rbi = root.create_module(custom_module_name)

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
      parameters: [ Parameter.new("id", type: "Integer") ],
      return_type: "T.nilable(#{self.model_class_name})",
    )
    custom_module_rbi.create_method(
      "find_by_id!",
      parameters: [ Parameter.new("id", type: "Integer") ],
      return_type: self.model_class_name,
    )
  end
end
