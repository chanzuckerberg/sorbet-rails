# typed: strict
class KaminariPlugin < SorbetRails::ModelPlugins::Base
  # Kaminari generates a dynamic `page` method on ActiveRecord relations.
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::Kaminari::ActiveRecordModelExtension)

    # Get the configured Kaminari page method name, or fall back to 'page' if necessary.
    page_method = T.unsafe(::Kaminari).config.page_method_name || 'page'

    # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-activerecord/lib/kaminari/activerecord/active_record_model_extension.rb#L15
    add_relation_query_method(
      root,
      page_method.to_s,
      parameters: [
        Parameter.new('num', type: 'T.nilable(Integer)', default: 'nil')
      ],
    )

    # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-core/lib/kaminari/models/page_scope_methods.rb#L7
    add_relation_query_method(
      root,
      "per",
      parameters: [
        Parameter.new('num', type: 'Integer'),
        Parameter.new('max_per_page', type: 'T.nilable(Integer)', default: 'nil')
      ],
    )

    # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-core/lib/kaminari/models/page_scope_methods.rb#L27
    add_relation_query_method(
      root,
      "padding",
      parameters: [
        Parameter.new('num', type: 'Integer')
      ],
    )

    # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-core/lib/kaminari/models/configuration_methods.rb#L19
    model_class_rbi = root.create_class(model_class_name)
    model_class_rbi.create_method(
      "default_per_page",
      return_type: "Integer",
      class_method: true,
    )

    # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-core/lib/kaminari/models/page_scope_methods.rb#L82
    model_relation_rbi = root.create_class(self.model_relation_class_name)
    model_relation_rbi.create_method(
      'last_page?',
      parameters: nil,
      return_type: 'T::Boolean',
    )
    model_assoc_relation_rbi = root.create_class(self.model_assoc_relation_class_name)
    model_assoc_relation_rbi.create_method(
      'last_page?',
      parameters: nil,
      return_type: 'T::Boolean',
    )
    collection_proxy_rbi = root.create_class(self.model_assoc_proxy_class_name)
    collection_proxy_rbi.create_method(
      'last_page?',
      parameters: nil,
      return_type: 'T::Boolean',
    )
  end
end
