# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRelationWhereMissing < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # https://api.rubyonrails.org/v6.1.4/classes/ActiveRecord/QueryMethods/WhereChain.html#method-i-missing
    # where.missing is only available in Rails 6.1 and above
    return if Rails.version =~ /^5\./ || Rails.version =~ /^6\.0/

    where_missing_module_name = self.model_module_name("ActiveRelation_WhereMissing")
    where_not_module_rbi = root.create_module(where_missing_module_name)

    model_relation_class_rbi = root.create_class(self.model_relation_class_name)
    model_relation_class_rbi.create_include(where_missing_module_name)

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rbi.create_include(where_missing_module_name)

    # `where` when not given parameters will return a `ActiveRecord::QueryMethods::WhereChain`
    # instance that has a method `missing` on it.
    # We add a `where_missing` method to allow accurate typing in lib/sorbet-rails/rails_mixins/custom_finder_methods.rb
    where_not_module_rbi.create_method(
      "where_missing",
      parameters: [
        Parameter.new("*args", type: "T.untyped", default: nil),
      ],
      return_type: "T.self_type",
    )
  end
end
