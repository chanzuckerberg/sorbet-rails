# Generate a Rails app.
# Use the rake tasks in this repository to generate the Rails apps.

def add_gems
  gem 'sorbet-rails', path: '../../../.'

  sorbet_version = ENV["SORBET_VERSION"]
  if sorbet_version
    # mostly used to test against a stable version of Sorbet in Travis.
    gem 'sorbet', sorbet_version
    gem 'sorbet-runtime', sorbet_version
  else
    # prefer to test against latest version because sorbet is updated frequently
    gem 'sorbet'
    gem 'sorbet-runtime'
  end
end

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
  if ENV['RAILS_VERSION'] == '4.2'
    file "app/models/application_record.rb", <<~RUBY
      class ApplicationRecord < ActiveRecord::Base
        self.abstract_class = true
      end
    RUBY
  end

  file "app/models/spell_book.rb", <<~RUBY
    class SpellBook < ApplicationRecord
      validates :name, length: { minimum: 5 }, presence: true
      belongs_to :wizard

      enum book_type: {
        unclassified: 0,
        biology: 1,
        dark_art: 999,
      }
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

      scope :recent, -> { where('created_at > ?', 1.month.ago) }
    end
  RUBY

  file "app/models/concerns/mythical.rb", <<~RUBY
    require 'active_support/concern'
    module Mythical
      extend ActiveSupport::Concern

      class_methods do
        def mythicals
          all.to_a # yeah!
        end
      end
    end
  RUBY
end

def create_migrations
  if ENV["RAILS_VERSION"] == "4.2"
    migration_superclass = 'ActiveRecord::Migration'
  else
    migration_superclass = "ActiveRecord::Migration[#{ENV['RAILS_VERSION']}]"
  end

  file "db/migrate/20190620000001_create_wizards.rb", <<~RUBY
    class CreateWizards < #{migration_superclass}
      def change
        create_table :wizards do |t|
          t.string :name
          t.integer :house
          t.string :parent_email
          t.text :notes

          t.timestamps
        end
      end
    end
  RUBY

  file "db/migrate/20190620000002_create_wands.rb", <<~RUBY
    class CreateWands < #{migration_superclass}
      def change
        create_table :wands do |t|
          t.references :wizard, unique: true, null: false
          t.string :wood_type
          t.integer :core_type

          t.timestamps
        end
      end
    end
  RUBY

  file "db/migrate/20190620000003_create_spell_books.rb", <<~RUBY
    class CreateSpellBooks < #{migration_superclass}
      def change
        create_table :spell_books do |t|
          t.string :name
          t.references :wizard
          t.integer :book_type, null: false, default: 0
        end
      end
    end
  RUBY

  file "db/migrate/20190620000004_add_more_column_types_to_wands.rb", <<~RUBY
    class AddMoreColumnTypesToWands < #{migration_superclass}
      def change
        add_column :wands, :flexibility,    :float,   null: false, default: 0.5
        add_column :wands, :hardness,       :decimal, null: false, precision: 10, scale: 10, default: 5
        add_column :wands, :reflectance,    :decimal, null: false, precision: 10, scale: 0, default: 0.5
        add_column :wands, :broken,         :boolean, null: false, default: false
        add_column :wands, :chosen_at_date, :date
        add_column :wands, :chosen_at_time, :time
        # JSON column type is only supported on 5.2 or higher
        unless ['4.2', '5.0', '5.1'].include?(ENV['RAILS_VERSION'])
          add_column :wands, :spell_history,  :json
          add_column :wands, :maker_info,     :json,    null: false, default: '{}'
        end
      end
    end
  RUBY
end

def add_sorbet_test_files
  file "typed-override.yaml", <<~YAML
    true:
    - ./sorbet_test_cases.rb
  YAML

  copy_file "./sorbet_test_cases.rb", "sorbet_test_cases.rb"
end

# Get files relative to this template when copying.
def source_paths
  [__dir__]
end

# Main setup
source_paths

if ['4.2', '5.0'].include?(ENV["RAILS_VERSION"])
  File.open('Gemfile', 'r+') do |f|
    out = ""
    f.each do |line|
      # We remove sdoc and web-console because they misbehave.
      # sqlite needs to be limited to 1.3.x or it won't work.
      out << line.gsub("gem 'sqlite3'", "gem 'sqlite3', '~> 1.3.6'") unless line =~ /gem \'(sdoc|web-console)\'.*/
    end
    f.pos = 0
    f.print out
    f.truncate(f.pos)
  end
end

add_gems

after_bundle do
  say "Creating application..."
  add_routes
  create_initializers
  create_lib
  create_helpers
  create_models
  create_migrations
  add_sorbet_test_files

  bundle_version = ENV["RAILS_VERSION"] == "4.2" ? "_1.17.3_" : ""

  Bundler.with_clean_env do
    # Rails 4.2 doesn't have the rails_command method, so just use run.
    run "bundle #{bundle_version} exec rake db:migrate"
  end

  if ENV["RUN_WITH_SORBET"] != 'false'
    Bundler.with_clean_env do
      run "SRB_YES=true bundle #{bundle_version} exec srb init"
      run "bundle #{bundle_version} exec rake rails_rbi:all"
      run "bundle #{bundle_version} exec srb rbi todo"
    end
  end
  say "Done!"
end
