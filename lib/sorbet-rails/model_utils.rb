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
  def model_relation_shared_module_name
    "#{model_class.name}::ModelRelationShared"
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
end