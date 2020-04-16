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

    sig { override.returns(T.class_of(ActiveRecord::Base)) }
    attr_reader :model_class

    sig { returns(T::Set[String]) }
    attr_reader :available_classes

    sig {
      params(
        model_class: T.class_of(ActiveRecord::Base),
        available_classes: T::Set[String],
      ).
      void
    }
    def initialize(model_class, available_classes)
      @model_class = T.let(model_class, T.class_of(ActiveRecord::Base))
      @available_classes = T.let(available_classes, T::Set[String])
    end

    sig { params(attribute: T.any(String, Symbol)).returns(T::Boolean) }
    def attribute_has_unconditional_presence_validation?(attribute)
      model_class.validators_on(attribute).any? do |validator|
        validator.is_a?(ActiveModel::Validations::PresenceValidator) &&
          !validator.options.key?(:if) &&
          !validator.options.key?(:unless)
      end
    end
  end
end
