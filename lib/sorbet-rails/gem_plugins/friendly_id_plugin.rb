# typed: strict
class FriendlyIdPlugin < SorbetRails::ModelPlugins::Base
  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.singleton_class.included_modules.include?(::FriendlyId)

    model_rbi = root.create_class(
      model_class_name,
      superclass: 'ApplicationRecord'
    )

    # Friendly method definition
    # https://github.com/norman/friendly_id/blob/53f1ca01c5d9e71b62812028ff009fd138fd41b5/lib/friendly_id/base.rb#L216
    model_rbi.create_method(
      'friendly',
      return_type: model_relation_class_name,
      class_method: true
    )
  end
end
