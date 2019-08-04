# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordNamedScope < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    ar_named_scope_rbi = root.create_module(self.model_relation_shared_module_name)
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

      ar_named_scope_rbi.create_method(
        method_name.to_s,
        parameters: [
          Parameter.new("*args", type: "T.untyped"),
        ],
        return_type: self.model_relation_class_name,
      )
    end
  end
end
