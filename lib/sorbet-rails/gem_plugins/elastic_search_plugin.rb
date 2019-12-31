# typed: strict
class ElasticSearchPlugin < SorbetRails::ModelPlugins::Base
  sig { override.params(root: Parlour::RbiGenerator::Namespace).void }
  def generate(root)
    return unless @model_class.include?(::Elasticsearch::Model)

    model_rbi = root.create_class(model_class_name)
    model_rbi.create_method(
      'mapping',
      class_method: true,
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          "options",
          type: "T.nilable(T::Hash[Symbol, T.untyped])", default: 'nil',
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          "&block",
          type: "T.proc.bind(Elasticsearch::Model::Indexing::Mappings).void",
        )
      ],
      return_type: "Elasticsearch::Model::Indexing::Mappings",
    )

    model_rbi.create_method(
      'mappings',
      class_method: true,
      parameters: [
        ::Parlour::RbiGenerator::Parameter.new(
          "options",
          type: "T.nilable(T::Hash[Symbol, T.untyped])", default: 'nil',
        ),
        ::Parlour::RbiGenerator::Parameter.new(
          "&block",
          type: "T.proc.bind(Elasticsearch::Model::Indexing::Mappings).void",
        )
      ],
      return_type: "Elasticsearch::Model::Indexing::Mappings",
    )
  end
end
