# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordNamedScope < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_class_rbi = root.create_class(self.model_class_name)

    @model_class.methods.sort.each do |method_name|
      method_obj = @model_class.method(method_name)
      next unless method_obj.present? && method_obj.source_location.present?
      # we detect sscopes defined in a model by 2 criteria:
      # - they don't have an owner name
      # - they are defined in 'activerecord/lib/active_record/scoping/named.rb'
      # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/scoping/named.rb
      next unless method_obj.owner.name == nil
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
