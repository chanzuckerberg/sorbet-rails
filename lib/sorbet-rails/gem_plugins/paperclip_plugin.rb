# typed: strict
class PaperclipPlugin < SorbetRails::ModelPlugins::Base
  sig { params(root: Parlour::RbiGenerator::Namespace).void.override }
  def generate(root)
    # method added here: https://github.com/thoughtbot/paperclip/blob/v5.2.1/lib/paperclip/has_attached_file.rb#L110

    return unless model_class.respond_to?(:attachment_definitions)

    module_name = self.model_module_name("GeneratedPaperclipMethods")
    module_rbi = root.create_module(module_name)

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(module_name)

    T.unsafe(::Paperclip::AttachmentRegistry).names_for(model_class).each do |attachment|
      # https://github.com/thoughtbot/paperclip/blob/v5.2.1/lib/paperclip/has_attached_file.rb#L42
      module_rbi.create_method(
        attachment.to_s,
        return_type: "::Paperclip::Attachment"
      )

      # https://github.com/thoughtbot/paperclip/blob/v5.2.1/lib/paperclip/attachment.rb#L100
      module_rbi.create_method(
        "#{attachment}=",
        parameters: [
          Parameter.new("uploaded_file", type: "T.untyped") # could be a variety of things
        ],
        return_type: nil
      )
    end
  end
end
