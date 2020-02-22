# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordFinderMethods < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)
    create_finder_methods_for(model_class_rbi, class_method: true, include_methods_that_return_self: false)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    create_finder_methods_for(model_relation_class_rbi, class_method: false, include_methods_that_return_self: false)

    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)
    create_finder_methods_for(model_assoc_proxy_class_rbi, class_method: false)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    create_finder_methods_for(model_assoc_relation_rbi, class_method: false)
  end

  sig do
    params(
      class_rbi: Parlour::RbiGenerator::ClassNamespace,
      class_method: T::Boolean,
      include_methods_that_return_self: T::Boolean
    ).void
  end
  def create_finder_methods_for(class_rbi, class_method:, include_methods_that_return_self: true)
    # The intent of this is to prevent these methods from being generated
    # unnecessarily when T.attached_class or Elem can be used to reduce
    # the number of method signatures that have to be generated.
    if include_methods_that_return_self
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
      class_rbi.create_method(
        "find_or_initialize_by",
        parameters: [
          Parameter.new("attributes", type: "T.untyped") ,
          Parameter.new(
            "&block",
            type: "T.nilable(T.proc.params(object: #{self.model_class_name}).void)",
          ),
        ],
        return_type: self.model_class_name,
        class_method: class_method
      )
      class_rbi.create_method(
        "find_or_create_by",
        parameters: [
          Parameter.new("attributes", type: "T.untyped") ,
          Parameter.new(
            "&block",
            type: "T.nilable(T.proc.params(object: #{self.model_class_name}).void)"
          ),
        ],
        return_type: self.model_class_name,
        class_method: class_method
      )
      class_rbi.create_method(
        "find_or_create_by!",
        parameters: [
          Parameter.new("attributes", type: "T.untyped") ,
          Parameter.new(
            "&block",
            type: "T.nilable(T.proc.params(object: #{self.model_class_name}).void)",
          ),
        ],
        return_type: self.model_class_name,
        class_method: class_method
      )

      ["first", "second", "third", "third_to_last", "second_to_last", "last"].
        each do |method_name|
          create_finder_method_pair(class_rbi, method_name, class_method)
        end
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
