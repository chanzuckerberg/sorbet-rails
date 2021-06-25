# typed: true
class MythicalRbiPlugin < SorbetRails::ModelPlugins::Base
  def generate(root)
    return unless @model_class.include?(Mythical)

    model_class_rbi = root.create_class(self.model_class_name)

    # ActiveSupport::Concern class method will be inserted to the class
    # directly. We need to also put the sig in the model class rbi directly
    model_class_rbi.create_method(
      'mythicals',
      class_method: true,
      return_type: "T::Array[#{model_class_name}]",
    )
  end
end
