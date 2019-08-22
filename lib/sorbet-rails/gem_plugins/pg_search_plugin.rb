# typed: strict
class PgSearchPlugin < SorbetRails::ModelPlugins::Base
  # If you include PgSearch::Model, the class implicitly gets methods from
  # PgSearch::Model::ClassMethods.
  sig { params(root: Parlour::RbiGenerator::Namespace).void.implementation }
  def generate(root)
    return unless @model_class.include?(::PgSearch::Model)

    model_rbi = root.create_class(
      model_class_name,
      superclass: T.must(@model_class.superclass).name
    )

    model_rbi.create_extend('PgSearch::Model::ClassMethods')
  end
end
