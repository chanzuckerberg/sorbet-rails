# typed: strict
class ActiveFlagPlugin < SorbetRails::ModelPlugins::Base
  sig { params(root: Parlour::RbiGenerator::Namespace).void.override }
  def generate(root)
    # method added here: https://github.com/kenn/active_flag/blob/master/lib/active_flag.rb#L13
    return unless model_class.respond_to?(:active_flags)

    module_name = self.model_module_name("GeneratedActiveFlagMethods")
    module_rbi = root.create_module(module_name)
    module_rbi.create_extend("T::Sig")

    model_class_rbi = root.create_class(self.model_class_name)
    model_class_rbi.create_include(module_name)

    module_rbi.create_method(
      "active_flags",
      return_type: "T::Hash[Symbol, ActiveFlag::Definition]",
      class_method: true
    )

    model_class.active_flags.keys.each do |flag|
      module_rbi.create_method(
        flag.to_s,
        return_type: "::ActiveFlag::Value"
      )

      module_rbi.create_method(
        "#{flag}=",
        parameters: [
          Parameter.new("value", type: "T::Array[Symbol]")
        ],
        return_type: nil
      )
    end
  end
end
