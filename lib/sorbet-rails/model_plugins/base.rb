# typed: strict
require('parlour')
require('sorbet-rails/model_utils')
module SorbetRails::ModelPlugins
  class Base < ::Parlour::Plugin
    extend T::Sig
    extend T::Helpers
    include SorbetRails::ModelUtils

    abstract!

    # convenient rename
    Parameter = ::Parlour::RbiGenerator::Parameter

    sig { returns(T.class_of(ActiveRecord::Base)) }
    attr_reader :model_class

    sig { returns(T::Array[T.class_of(ActiveRecord::Base)]) }
    attr_reader :available_classes

    sig {
      params(
        model_class: T.class_of(ActiveRecord::Base),
        available_classes: T::Array[T.class_of(ActiveRecord::Base)],
      ).
      void
    }
    def initialize(model_class, available_classes)
      @model_class = T.let(model_class, T.class_of(ActiveRecord::Base))
      @available_classes = T.let(available_classes, T::Array[T.class_of(ActiveRecord::Base)])
    end

    sig { abstract.params(root: Parlour::RbiGenerator::Namespace).void }
    def generate(root); end
  end
end
