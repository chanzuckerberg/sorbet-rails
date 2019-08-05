# typed: true
class KaminariPlugin < SorbetRails::ModelPlugins::Base
  # Kaminari generates a dynamic `page` method on ActiveRecord relations.
  # https://github.com/kaminari/kaminari/blob/c5186f5d9b7f23299d115408e62047447fd3189d/kaminari-activerecord/lib/kaminari/activerecord/active_record_model_extension.rb#L15
  sig { implementation.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(Kaminari::ActiveRecordModelExtension)

    ar_querying_rbi = root.create_module(model_relation_shared_module_name)
    ar_querying_rbi.create_include('Kaminari::ActiveRecordModelExtension')

    # Get the configured Kaminari page method name, or fall back to 'page' if necessary.
    page_method = Kaminari.config.page_method_name || 'page'

    kaminari_activerecord_extension = root.create_module('Kaminari::ActiveRecordModelExtension')
    kaminari_activerecord_extension.create_method(
      page_method.to_s,
      parameters: [
        Parameter.new('num', type: 'Integer', default: 'nil')
      ],
      return_type: model_relation_class_name
    )
  end
end
