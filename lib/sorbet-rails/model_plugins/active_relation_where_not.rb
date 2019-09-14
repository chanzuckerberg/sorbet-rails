# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRelationWhereNot < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    where_not_module_name = self.model_module_name("ActiveRelation_WhereNot")
    where_not_module_rbi = root.create_module(where_not_module_name)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    model_relation_class_rbi.create_include(where_not_module_name)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rbi.create_include(where_not_module_name)

    # TODO: where.not is a special case that we replace it with a `where_not` method
    # `where` when not given parameters will return a `ActiveRecord::QueryMethods::WhereChain`
    # instance that has a method `not` on it
    where_not_module_rbi.create_method(
      "not",
      parameters: [
        Parameter.new("opts", type: "T.untyped", default: nil),
        Parameter.new("*rest", type: "T.untyped", default: nil),
      ],
      return_type: "T.self_type",
    )
  end
end