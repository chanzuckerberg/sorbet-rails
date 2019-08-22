# typed: strict
class KaminariPlugin < SorbetRails::ModelPlugins::Base
  # Kaminari generates a dynamic `page` method on ActiveRecord relations.
  # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-activerecord/lib/kaminari/activerecord/active_record_model_extension.rb#L15
  sig { params(root: Parlour::RbiGenerator::Namespace).void.implementation }
  def generate(root)
    return unless @model_class.include?(Kaminari::ActiveRecordModelExtension)

    # Get the configured Kaminari page method name, or fall back to 'page' if necessary.
    page_method = T.unsafe(Kaminari).config.page_method_name || 'page'

    add_relation_query_method(
      root,
      page_method.to_s,
      parameters: [
        Parameter.new('num', type: 'T.nilable(Integer)', default: 'nil')
      ],
    )
  end
end
