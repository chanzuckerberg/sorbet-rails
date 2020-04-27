# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::EnumerableCollections < SorbetRails::ModelPlugins::Base

  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_assoc_proxy_class_rbi = root.create_class(self.model_assoc_proxy_class_name)

    # following methods only exists in an association proxy
    ["<<", "append", "push", "concat"].each do |method_name|
      elem = self.model_class_name
      model_assoc_proxy_class_rbi.create_method(
        method_name,
        parameters: [
          Parameter.new("*records", type: "T.any(#{elem}, T::Array[#{elem}])"),
        ],
        return_type: "T.self_type",
      )
    end
  end
end
