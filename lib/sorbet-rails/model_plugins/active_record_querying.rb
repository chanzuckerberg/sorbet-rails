# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordQuerying < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # All is a named scope that most method from ActiveRecord::Querying delegate to
    # rails/activerecord/lib/active_record/querying.rb:21
    add_relation_query_method(
      root,
      "all",
      builtin_query_method: true,
    )
    add_relation_query_method(
      root,
      "unscoped",
      parameters: [
        Parameter.new("&block", type: "T.nilable(T.proc.void)"),
      ],
      builtin_query_method: true,
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
        builtin_query_method: true,
      ) if exists_class_method?(method_name)
    end

    add_relation_query_method(
      root,
      "extending",
      parameters: [
        Parameter.new("*args", type: "T.untyped"),
        Parameter.new("&block", type: "T.nilable(T.proc.void)"),
      ],
      builtin_query_method: true,
    )

    # These are technically "query methods" but they aren't chainable so instead of
    # adding conditionals to `add_relation_query_method` to handle this we'll just
    # handle them here.
    relation_module_rbi = root.create_module(self.model_query_methods_returning_relation_module_name)
    create_in_batches_method(relation_module_rbi, inner_type: self.model_relation_class_name)

    assoc_relation_module_rbi = root.create_module(self.model_query_methods_returning_assoc_relation_module_name)
    create_in_batches_method(assoc_relation_module_rbi, inner_type: self.model_assoc_relation_class_name)
  end

  private

  sig { params(root: Parlour::RbiGenerator::Namespace, inner_type: String).void }
  def create_in_batches_method(root, inner_type:)
    root.create_method(
      "in_batches",
      parameters: [
        Parameter.new("of:", type: "T.nilable(Integer)", default: "1000"),
        Parameter.new("start:", type: "T.nilable(Integer)", default: "nil"),
        Parameter.new("finish:", type: "T.nilable(Integer)", default: "nil"),
        Parameter.new("load:", type: "T.nilable(T::Boolean)", default: "false"),
        Parameter.new("error_on_ignore:", type: "T.nilable(T::Boolean)", default: "nil"),
        Parameter.new("&block", type: "T.nilable(T.proc.params(e: #{inner_type}).void)"),
      ],
      return_type: "ActiveRecord::Batches::BatchEnumerator",
    )
  end
end
