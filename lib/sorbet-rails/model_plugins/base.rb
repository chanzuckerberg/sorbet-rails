# typed: true
require('parlour')
require('sorbet-rails/model_utils')
module SorbetRails::ModelPlugins
  class Base < ::Parlour::Plugin
    include SorbetRails::ModelUtils

    # convenient rename
    Parameter = ::Parlour::RbiGenerator::Parameter

    attr_reader :model_class
    attr_reader :available_classes

    def initialize(model_class, available_classes)
      @model_class = model_class
      @available_classes = available_classes
    end
  end
end
