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

    sig { params(column_name: String).returns(T.nilable(Class)) }
    def serialization_coder_for_column(column_name)
      column_type = @model_class.type_for_attribute(column_name)
      return unless column_type.is_a?(ActiveRecord::Type::Serialized)

      if column_type.coder.respond_to?(:object_class)
        column_type.coder.object_class
      else
        Object
      end
    end
  end
end
