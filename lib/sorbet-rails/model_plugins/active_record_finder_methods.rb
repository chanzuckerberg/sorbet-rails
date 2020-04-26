# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordFinderMethods < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)
    create_finder_methods_for(model_class_rbi, class_method: true)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    create_finder_methods_for(model_relation_class_rbi, class_method: false)

    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)
    create_finder_methods_for(model_assoc_proxy_class_rbi, class_method: false)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    create_finder_methods_for(model_assoc_relation_rbi, class_method: false)
  end

  sig do
    params(
      class_rbi: Parlour::RbiGenerator::ClassNamespace,
      class_method: T::Boolean,
    ).void
  end
  def create_finder_methods_for(class_rbi, class_method:)
    # Checker methods
    class_rbi.create_method(
      "exists?",
      parameters: [ Parameter.new("conditions", type: "T.untyped", default: "nil") ],
      return_type: "T::Boolean",
      class_method: class_method,
    )

    ["any?", "many?", "none?", "one?", "empty?"].each do |method_name|
      class_rbi.create_method(
        method_name,
        parameters: [ Parameter.new("*args", type: "T.untyped") ],
        return_type: "T::Boolean",
        class_method: class_method,
      )
    end
  end
end
