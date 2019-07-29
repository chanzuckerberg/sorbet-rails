# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordQuerying < SorbetRails::ModelPlugins::Base

  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # All is a named scope that most method from ActiveRecord::Querying delegate to
    # rails/activerecord/lib/active_record/querying.rb:21
    ar_querying_rbi = root.create_module(self.model_relation_shared_module_name)
    ar_querying_rbi.create_method(
      "all",
      return_type: self.model_relation_class_name,
    )
    ar_querying_rbi.create_method(
      "unscoped",
      parameters: [
        Parameter.new("&block", type: "T.nilable(T.proc.void)"),
      ],
      return_type: self.model_relation_class_name,
    )

    # It's not possible to typedef all methods in ActiveRecord::Querying module to have the
    # matching type. By generating model-specific sig, we can typedef these methods to return
    # <Model>::Relation class.
    # rails/activerecord/lib/active_record/querying.rb
    model_query_relation_methods = [
      :select, :reselect, :order, :reorder, :group, :limit, :offset, :joins, :left_joins, :left_outer_joins,
      :where, :rewhere, :preload, :extract_associated, :eager_load, :includes, :from, :lock, :readonly, :extending, :or,
      :having, :create_with, :distinct, :references, :none, :unscope, :optimizer_hints, :merge, :except, :only,
    ]
    model_query_relation_methods.each do |method_name|
      ar_querying_rbi.create_method(
        method_name.to_s,
        parameters: [
          Parameter.new("*args", type: "T.untyped"),
          Parameter.new("&block", type: "T.nilable(T.proc.void)"),
        ],
        return_type: self.model_relation_class_name,
      ) if exists_class_method?(method_name)
    end
  end
end