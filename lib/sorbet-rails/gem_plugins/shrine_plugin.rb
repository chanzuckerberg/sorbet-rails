# typed: false
class ShrinePlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_rbi = root.create_class(model_class_name)
    processed_attachments = Set.new
    @model_class.included_modules.each do |included_module|
      # based on https://github.com/shrinerb/shrine/blob/master/lib/shrine/attachment.rb
      if included_module.is_a?(Shrine::Attachment)
        attachment_name = included_module.attachment_name.to_s
        next if processed_attachments.include?(attachment_name)
        processed_attachments.add(attachment_name)

        # TODO: detect nilability based on column nilability
        model_rbi.create_method(
          attachment_name,
          return_type: "T.nilable(#{included_module.shrine_class}::UploadedFile)",
        )
        model_rbi.create_method(
          "#{attachment_name}=",
          parameters: [
            ::Parlour::RbiGenerator::Parameter.new(
              "file",
              type:
                "T.any(String, T::Hash[T.untyped, T.untyped],
                #{included_module.shrine_class}::UploadedFile)".squish!,
            ),
          ],
        )
        model_rbi.create_method(
          "#{attachment_name}_attacher",
          return_type: "T.nilable(#{included_module.shrine_class}::Attacher)",
        )

        # remote_url plugin
        # https://github.com/shrinerb/shrine/blob/2b7fad37dbaa955a7d3b82e9e05eaacb3506b4ba/
        # ../lib/shrine/plugins/remote_url.rb
        if included_module.is_a?(Shrine::Plugins::RemoteUrl::AttachmentMethods)
          model_rbi.create_method(
            "#{attachment_name}_remote_url",
            return_type: "T.nilable(String)",
          )
          model_rbi.create_method(
            "#{attachment_name}_remote_url=",
            parameters: [
              ::Parlour::RbiGenerator::Parameter.new(
                "url",
                type: "T.untyped" # TODO likely T.nilable(String)
              ),
            ],
          )
        end

        #--
        attachment = Object.const_get("#{included_module.shrine_class}::Attachment")
        attachment_rbi = root.create_class(
          attachment.name,
          superclass: 'Shrine::Attachment',
        )
        attachment_rbi.create_method(
          "initialize",
          parameters: [
            ::Parlour::RbiGenerator::Parameter.new('name', type: 'T.any(String, Symbol)'),
            ::Parlour::RbiGenerator::Parameter.new('**option', type: 'T.untyped'),
          ]
        )
        #--
        attacher = Object.const_get("#{included_module.shrine_class}::Attacher")
        attacher_rbi = root.create_class(
          attacher.name,
          superclass: 'Shrine::Attacher',
        )
        #--
        uploaded_file = Object.const_get("#{included_module.shrine_class}::UploadedFile")
        uploaded_file_rbi = root.create_class(
          uploaded_file.name,
          superclass: 'Shrine::UploadedFile',
        )
      end
    end
  end
end
