# Generate a Rails 6.0 app.
def add_routes
  route "get 'test/index' => 'test#index'"
end

def create_initializers
  initializer "sorbet_rails.rb", <<~RUBY
    # typed: strict
    require(Rails.root.join('lib/mythical_rbi_plugin'))
    SorbetRails::ModelRbiFormatter.register_plugin(MythicalRbiPlugin)
  RUBY
end

def create_lib
  lib "mythical_rbi_plugin.rb", <<~'RUBY'
    # typed: true
    class MythicalRbiPlugin < SorbetRails::ModelPlugins::Base
      def generate(root)
        return unless @model_class.include?(Mythical)

        model_class_rbi = root.create_class(self.model_class_name)

        # ActiveSupport::Concern class method will be inserted to the class
        # directly. We need to also put the sig in the model class rbi directly
        model_class_rbi.create_method(
          'mythicals',
          class_method: true,
          return_type: "T::Array[#{@model_class.name}]",
        )
      end
    end
  RUBY
end

def create_helpers
  file "app/helpers/foo_helper.rb", <<~RUBY
    module FooHelper
    end
  RUBY

  file "app/helpers/bar_helper.rb", <<~RUBY
    module BarHelper
    end
  RUBY

  file "app/helpers/baz_helper.rb", <<~RUBY
    module BazHelper
    end
  RUBY
end

def create_models
  file "app/models/spell_book.rb", <<~RUBY
    class SpellBook < ApplicationRecord
      validates :name, length: { minimum: 5 }, presence: true
      belongs_to :wizard
    end
  RUBY

  file "app/models/potion.rb", <<~RUBY
    # an abstract class that has no table
    class Potion < ApplicationRecord
      self.abstract_class = true
    end
  RUBY

  file "app/models/wand.rb", <<~RUBY
    class Wand < ApplicationRecord
      include Mythical
    
      enum core_type: {
        phoenix_feather: 0,
        dragon_heartstring: 1,
        unicorn_tail_hair: 2,
        basilisk_horn: 3,
      }
    
      belongs_to :wizard
    
      def wood_type
        'Type ' + super
      end
    end
  RUBY

  file "app/models/wizard.rb", <<~RUBY
    class Wizard < ApplicationRecord
      validates :name, length: { minimum: 5 }, presence: true

      enum house: {
        Gryffindor: 0,
        Hufflepuff: 1,
        Ravenclaw: 2,
        Slytherin: 3,
      }

      has_one :wand
      has_many :spell_books
    end
  RUBY
end

# Main setup
after_bundle do
  say "Creating application..."
  add_routes
  create_initializers
  create_lib
  create_helpers
  create_models
  say "Done."
end
