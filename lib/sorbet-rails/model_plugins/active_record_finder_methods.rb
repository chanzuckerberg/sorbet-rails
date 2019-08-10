# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordFinderMethods < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)
    create_finder_methods_for(model_class_rbi, class_method: true)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    create_finder_methods_for(model_relation_class_rbi, class_method: false)

    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)
    create_finder_methods_for(model_assoc_proxy_class_rbi, class_method: false)
  end

  sig { params(class_rbi: Parlour::RbiGenerator::ClassNamespace, class_method: T::Boolean).void }
  def create_finder_methods_for(class_rbi, class_method:)
    class_rbi.create_method(
      "find",
      parameters: [ Parameter.new("*args", type: "T.untyped") ],
      return_type: self.model_class_name,
      class_method: class_method,
    )
    class_rbi.create_method(
      "find_by",
      parameters: [ Parameter.new("*args", type: "T.untyped") ],
      return_type: "T.nilable(#{self.model_class_name})",
      class_method: class_method,
    )
    class_rbi.create_method(
      "find_by!",
      parameters: [ Parameter.new("*args", type: "T.untyped") ],
      return_type: self.model_class_name,
      class_method: class_method
    )

    ["first", "second", "third", "third_to_last", "second_to_last", "last"].
      each do |method_name|
        create_finder_method_pair(class_rbi, method_name, class_method)
      end

    # Checker methods
    class_rbi.create_method(
      "exists?",
      parameters: [ Parameter.new("conditions", type: "T.untyped", default: "nil") ],
      return_type: "T::Boolean",
      class_method: class_method,
    )
    ["any?", "many?", "none?", "one?"].each do |method_name|
      class_rbi.create_method(
        method_name,
        parameters: [ Parameter.new("*args", type: "T.untyped") ],
        return_type: "T::Boolean",
        class_method: class_method,
      )
    end
  end

  sig {
    params(
      class_rbi: Parlour::RbiGenerator::ClassNamespace,
      method_name: String,
      class_method: T::Boolean,
    ).
    void
  }
  def create_finder_method_pair(class_rbi, method_name, class_method)
    class_rbi.create_method(
      method_name,
      return_type: "T.nilable(#{self.model_class_name})",
      class_method: class_method,
    )
    class_rbi.create_method(
      "#{method_name}!",
      return_type: self.model_class_name,
      class_method: class_method,
    )
  end
end
