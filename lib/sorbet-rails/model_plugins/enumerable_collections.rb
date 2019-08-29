# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::EnumerableCollections < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # model relation & association proxy are enumerable
    # we need to implement "each" in these methods so that they work
    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    create_enumerable_methods_for(model_relation_class_rbi)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    create_enumerable_methods_for(model_assoc_relation_rbi)

    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)
    create_enumerable_methods_for(model_assoc_proxy_class_rbi)

    # following methods only exists in an association proxy
    ["<<", "append", "push", "concat"].each do |method_name|
      elem = self.model_class_name
      model_assoc_proxy_class_rbi.create_method(
        method_name,
        parameters: [
          Parameter.new("*records", type: "T.any(#{elem}, T::Array[#{elem}])"),
        ],
        return_type: "T.self_type",
      )
    end
  end

  sig { params(class_rbi: Parlour::RbiGenerator::ClassNamespace).void }
  def create_enumerable_methods_for(class_rbi)
    class_rbi.create_include("Enumerable")
    class_rbi.create_method(
      "each",
      parameters: [
        Parameter.new("&block", type: "T.proc.params(e: #{self.model_class_name}).void")
      ],
      implementation: true,
    )
    class_rbi.create_method(
      "flatten",
      parameters: [ Parameter.new("level", type: "T.nilable(Integer)") ],
      return_type: "T::Array[#{self.model_class_name}]",
    )
    # this is an escape hatch when there are conflicts in signatures of Enumerable & ActiveRecord
    class_rbi.create_method(
      "to_a",
      return_type: "T::Array[#{self.model_class_name}]",
    )
    # TODO use type_parameters(:U) when parlour supports it
    class_rbi.create_arbitrary(
      code: <<~RUBY
        sig do
          type_parameters(:U).params(
              blk: T.proc.params(arg0: Elem).returns(T.type_parameter(:U)),
          )
          .returns(T::Array[T.type_parameter(:U)])
        end
        def map(&blk); end
      RUBY
    )
  end
end
