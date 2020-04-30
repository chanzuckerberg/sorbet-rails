# typed: strict
require ('sorbet-rails/model_plugins/base')
require("sorbet-rails/utils")
class SorbetRails::ModelPlugins::ActiveRecordNamedScope < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)

    # Named scope methods are dynamically defined by the `scope` method so their
    # source_location is `lib/active_record/scoping/named.rb`. So we find scopes
    # by two criteria:
    # - they are defined in 'activerecord/lib/active_record/scoping/named.rb'
    # - they are not one of the methods actually defined in that file's source.
    # See: https://github.com/rails/rails/blob/master/activerecord/lib/active_record/scoping/named.rb
    non_dynamic_methods = (
      ActiveRecord::Scoping::Named::ClassMethods.instance_methods +
      ActiveRecord::Scoping::Named::ClassMethods.protected_instance_methods +
      ActiveRecord::Scoping::Named::ClassMethods.private_instance_methods
    )

    (@model_class.methods - non_dynamic_methods).sort.each do |method_name|
      next unless SorbetRails::Utils.valid_method_name?(method_name.to_s)

      method_obj = @model_class.method(method_name)
      next unless method_obj.present? && method_obj.source_location.present?

      source_file = method_obj.source_location[0]
      next unless source_file.include?("lib/active_record/scoping/named.rb")

      add_relation_query_method(
        root,
        method_name.to_s,
        parameters: [
          Parameter.new("*args", type: "T.untyped"),
        ],
      )
    end
  end
end
