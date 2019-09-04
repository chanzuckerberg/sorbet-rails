# typed: strict
module SorbetRails::ModelUtils
  extend T::Sig
  extend T::Helpers

  abstract!

  sig { abstract.returns(T.class_of(ActiveRecord::Base)) }
  def model_class; end

  sig { returns(String) }
  def model_class_name
    "#{model_class.name}"
  end

  sig { returns(String) }
  def model_relation_class_name
    "#{model_class.name}::ActiveRecord_Relation"
  end

  sig { returns(String) }
  def model_assoc_proxy_class_name
    "#{model_class.name}::ActiveRecord_Associations_CollectionProxy"
  end

  sig { returns(String) }
  def model_assoc_relation_class_name
    "#{model_class.name}::ActiveRecord_AssociationRelation"
  end

  sig { params(module_name: String).returns(String) }
  def model_module_name(module_name)
    "#{model_class.name}::#{module_name}"
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
    ).void
  }
  def add_relation_query_method(root, method_name, parameters: nil)
    # a relation querying method will be available on
    # - model (as a class method)
    # - activerecord relation
    # - asocciation collection proxy
    # - association relation
    # in case (1) and (2), it returns a Model::ActiveRecord_Relation
    # in case (3) and (4), it returns a Model::ActiveRecord_AssociationRelation

    # force generating these methods because sorbet's hidden-definitions generate & override them
    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_method(
      method_name,
      parameters: parameters,
      return_type: self.model_relation_class_name,
      class_method: true,
    )

    model_relation_rbi = root.create_class(self.model_relation_class_name)
    model_relation_rbi.create_method(
      method_name,
      parameters: parameters,
      return_type: self.model_relation_class_name,
    )

    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rbi.create_method(
      method_name,
      parameters: parameters,
      return_type: self.model_assoc_relation_class_name,
    )

    collection_proxy_rbi = root.create_class(self.model_assoc_proxy_class_name)
    collection_proxy_rbi.create_method(
      method_name,
      parameters: parameters,
      return_type: self.model_assoc_relation_class_name,
    )
  end
end