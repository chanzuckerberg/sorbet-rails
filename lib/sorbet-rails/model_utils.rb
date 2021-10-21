# typed: strict
require('sorbet-rails/model_column_utils')
module SorbetRails::ModelUtils
  extend T::Sig
  extend T::Helpers
  include SorbetRails::ModelColumnUtils

  abstract!

  # if we're a HABTM class then model_class is an anonymous class (see the rails link below) and
  # i'm not sure how to explain that to sorbet other than T.class_of(Class).
  # This is also defined in ModelColumnUtils
  # sig { abstract.returns(T.any(T.class_of(ActiveRecord::Base), T.class_of(Class))) }
  # def model_class; end

  sig { returns(T::Boolean) }
  def habtm_class?
    # checking the class name seems to be the cleanest way to figure this out, see:
    # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/associations/builder/has_and_belongs_to_many.rb#L54
    T.must(model_class.name).start_with?('HABTM_')
  end

  sig { returns(String) }
  def model_class_name
    model_class.to_s
  end

  sig { returns(String) }
  def model_relation_class_name
    "#{model_class_name}::ActiveRecord_Relation"
  end

  sig { returns(String) }
  def model_assoc_proxy_class_name
    "#{model_class_name}::ActiveRecord_Associations_CollectionProxy"
  end

  sig { returns(String) }
  def model_assoc_relation_class_name
    "#{model_class_name}::ActiveRecord_AssociationRelation"
  end

  sig { returns(String) }
  def model_query_methods_returning_relation_module_name
    "#{model_class_name}::QueryMethodsReturningRelation"
  end

  sig { returns(String) }
  def model_query_methods_returning_assoc_relation_module_name
    "#{model_class_name}::QueryMethodsReturningAssociationRelation"
  end

  sig { returns(String) }
  def model_relation_type_alias
    types = [
      self.model_relation_class_name,
      self.model_assoc_proxy_class_name,
      self.model_assoc_relation_class_name
    ].join(', ')

    "T.any(#{types})"
  end

  sig { returns(String) }
  def model_relation_type_class_name
    'RelationType'
  end

  sig { params(module_name: String).returns(String) }
  def model_module_name(module_name)
    "#{model_class_name}::#{module_name}"
  end

  sig { params(method_name: T.any(String, Symbol)).returns(T::Boolean) }
  def exists_instance_method?(method_name)
    model_class.method_defined?(method_name)
  end

  sig { params(method_name: T.any(String, Symbol)).returns(T::Boolean) }
  def exists_class_method?(method_name)
    model_class.respond_to?(method_name)
  end

  sig {
    params(
      root: Parlour::RbiGenerator::Namespace,
      method_name: String,
      parameters: T.nilable(T::Array[::Parlour::RbiGenerator::Parameter]),
      # This is meant to indicate the method is a rails-provided query method like
      # where, limit, etc and not something like a named scope. It should likely
      # only be set to `true` when called from the ActiveRecordQuerying plugin.
      builtin_query_method: T::Boolean,
      custom_return_value: T.nilable(String),
    ).void
  }
  def add_relation_query_method(
    root,
    method_name,
    parameters: nil,
    builtin_query_method: false,
    custom_return_value: nil
  )
    # a relation querying method will be available on
    # - model (as a class method)
    # - activerecord relation
    # - asocciation collection proxy
    # - association relation
    # in case (1) and (2), it returns a Model::ActiveRecord_Relation
    # in case (3) and (4), it returns a Model::ActiveRecord_AssociationRelation

    # 'unscoped' is a special case where it always returns a ActiveRecord_Relation
    assoc_return_value = method_name == 'unscoped' ? self.model_relation_class_name : self.model_assoc_relation_class_name

    # We can put methods onto modules which are extended/included by the model
    # and relation classes which reduces the RBI footprint for an individual
    # model. However, in Rails 5 query methods that come from scopes or enums
    # get overridden in hidden-definitions so we need to explicitly define them
    # on the model and relation classes.
    if builtin_query_method
      relation_module_rbi = root.create_module(self.model_query_methods_returning_relation_module_name)
      relation_module_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || self.model_relation_class_name,
      )

      assoc_relation_module_rbi = root.create_module(self.model_query_methods_returning_assoc_relation_module_name)
      assoc_relation_module_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || assoc_return_value,
      )
    else
      # force generating these methods because sorbet's hidden-definitions generate & override them
      model_class_rbi = root.create_class(self.model_class_name)
      model_class_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || self.model_relation_class_name,
        class_method: true,
      )

      model_relation_rbi = root.create_class(self.model_relation_class_name)
      model_relation_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || self.model_relation_class_name,
      )

      model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
      model_assoc_relation_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || assoc_return_value,
      )

      collection_proxy_rbi = root.create_class(self.model_assoc_proxy_class_name)
      collection_proxy_rbi.create_method(
        method_name,
        parameters: parameters,
        return_type: custom_return_value || assoc_return_value,
      )
    end
  end
end
