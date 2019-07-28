# typed: true
module SorbetRails::ModelUtils
  MODEL_CLASS_MODULE_SUFFIX = "ClassMethods"
  MODEL_INSTANCE_MODULE_SUFFIX = "InstanceMethods"

  # abstract
  def model_class; end

  def model_class_name
    "#{model_class.name}"
  end

  def model_relation_class_name
    "#{model_class.name}::ActiveRecord_Relation"
  end

  def model_assoc_proxy_class_name
    "#{model_class.name}::ActiveRecord_Associations_CollectionProxy"
  end

  def model_relation_shared_module_name
    "#{model_class.name}::ModelRelationShared"
  end

  def model_module_name(module_name)
    "#{model_class.name}::#{module_name}"
  end

  def exists_instance_method?(method_name)
    model_class.method_defined?(method_name)
  end

  def exists_class_method?(method_name)
    model_class.respond_to?(method_name)
  end
end