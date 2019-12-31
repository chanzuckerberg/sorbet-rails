# typed: strong
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordQuerying < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # All is a named scope that most method from ActiveRecord::Querying delegate to
    # rails/activerecord/lib/active_record/querying.rb:21
    add_relation_query_method(
      root,
      "all",
    )
    add_relation_query_method(
      root,
      "unscoped",
      parameters: [
        Parameter.new("&block", type: "T.nilable(T.proc.void)"),
      ],
    )

    # It's not possible to typedef all methods in ActiveRecord::Querying module to have the
    # matching type. By generating model-specific sig, we can typedef these methods to return
    # <Model>::Relation class.
    # rails/activerecord/lib/active_record/querying.rb
    model_query_relation_methods = [
      :select, :reselect, :order, :reorder, :group, :limit, :offset, :joins, :left_joins, :left_outer_joins,
      :where, :rewhere, :preload, :extract_associated, :eager_load, :includes, :from, :lock, :readonly, :or,
      :having, :create_with, :distinct, :references, :none, :unscope, :optimizer_hints, :merge, :except, :only,
    ]
    model_query_relation_methods.each do |method_name|
      add_relation_query_method(
        root,
        method_name.to_s,
        parameters: [
          Parameter.new("*args", type: "T.untyped"),
        ],
      ) if exists_class_method?(method_name)
    end

    add_relation_query_method(
      root,
      "extending",
      parameters: [
        Parameter.new("*args", type: "T.untyped"),
        Parameter.new("&block", type: "T.nilable(T.proc.void)"),
      ]
    )
  end
end