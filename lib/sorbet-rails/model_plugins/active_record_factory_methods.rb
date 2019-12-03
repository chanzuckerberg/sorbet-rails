# typed: strict
require ('sorbet-rails/model_plugins/base')
class SorbetRails::ModelPlugins::ActiveRecordFactoryMethods < SorbetRails::ModelPlugins::Base
  # Create methods like `new`, `create`, `create!`, etc.
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    model_rbi = root.create_class(self.model_class_name)

    factory_methods = ['create', 'create!', 'new']

    # factory_methods.each do |factory_method|
    #   add_factory_method(model_rbi, factory_method)
    # end
  end

  sig { params(model_rbi: Parlour::RbiGenerator::ClassNamespace, method_name: String).void }
  def add_factory_method(model_rbi, method_name)
    model_rbi.create_method(
      method_name,
      parameters: [
        Parlour::RbiGenerator::Parameter.new("attributes", type: "T.untyped", default: 'nil'),
        Parlour::RbiGenerator::Parameter.new("&block", type: "T.untyped")
      ],
      return_type: self.model_class_name,
      class_method: true
    )
  end
end
