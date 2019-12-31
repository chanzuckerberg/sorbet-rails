# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveStorageMethods < SorbetRails::ModelPlugins::Base
  sig { params(model_class: T.class_of(ActiveRecord::Base), available_classes: T::Set[String]).void }
  def initialize(model_class, available_classes)
    super
  end

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    # Check that ActiveStorage the attachment_reflections method exists
    # It was added in 6.0, so it isn't available for 5.2.
    return unless defined?(@model_class.attachment_reflections) && @model_class.attachment_reflections.length > 0

    assoc_module_name = self.model_module_name("GeneratedAssociationMethods")
    assoc_module_rbi = root.create_module(assoc_module_name)

    attachment_reflections = @model_class.attachment_reflections.transform_values { |attachment| attachment.class }

    attachment_reflections.each do |assoc_name, attachment_type|
      if attachment_type.to_s == 'ActiveStorage::Reflection::HasOneAttachedReflection'
        create_has_one_methods(assoc_name, assoc_module_rbi)
      elsif attachment_type.to_s == 'ActiveStorage::Reflection::HasManyAttachedReflection'
        create_has_many_methods(assoc_name, assoc_module_rbi)
      end
    end
  end

  sig { params(assoc_name: String, mod: Parlour::RbiGenerator::Namespace).void }
  def create_has_one_methods(assoc_name, mod)
    mod.create_method(
      assoc_name,
      return_type: 'T.nilable(ActiveStorage::Attached::One)'
    )

    mod.create_method(
      "#{assoc_name}=",
      parameters: [
        Parameter.new('attachable', type: 'T.untyped')
      ],
      return_type: 'T.untyped'
    )
  end

  sig { params(assoc_name: String, mod: Parlour::RbiGenerator::Namespace).void }
  def create_has_many_methods(assoc_name, mod)
    mod.create_method(
      assoc_name,
      return_type: 'T.nilable(ActiveStorage::Attached::Many)'
    )

    mod.create_method(
      "#{assoc_name}=",
      parameters: [
        Parameter.new('*attachables', type: 'T.untyped')
      ],
      return_type: 'T.untyped'
    )
  end
end
