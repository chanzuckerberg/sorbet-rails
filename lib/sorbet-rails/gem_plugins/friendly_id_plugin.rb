# typed: strong
class FriendlyIdPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.singleton_class.included_modules.include?(::FriendlyId)

    # Friendly method definition
    # https://github.com/norman/friendly_id/blob/53f1ca01c5d9e71b62812028ff009fd138fd41b5/lib/friendly_id/base.rb#L216
    add_relation_query_method(
      root,
      'friendly'
    )
  end
end
