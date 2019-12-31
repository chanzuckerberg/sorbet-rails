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

def add_environment
  if ENV["RAILS_VERSION"] == "5.0"
    # by default, Rails 5.0 treats only `datetime` as a time zone aware type;
    # this config option brings it in line with all versions up to at least v6.0
    # and makes our time-related attribute fixtures simpler to maintain
    environment 'config.active_record.time_zone_aware_types = [:datetime, :time]'
  end
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

      # simulate when belongs_to is optional by default, but it is enforced at the DB level
      belongs_to :wizard, optional: true

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
      belongs_to :wizard, required: false
    end
  RUBY

  file "app/models/wand.rb", <<~RUBY
    class Wand < ApplicationRecord
      include Mythical

      self.skip_time_zone_conversion_for_attributes = [:broken_at]

      enum core_type: {
        phoenix_feather: 0,
        dragon_heartstring: 1,
        unicorn_tail_hair: 2,
        basilisk_horn: 3,
      }

      belongs_to :wizard, required: true

      def wood_type
        'Type ' + super
      end
    end
  RUBY

  # A nasty hack to add has_one_attached and has_many_attached to the models/wizard.rb file.
  attachments = nil
  if ['5.2', '6.0'].include?(ENV["RAILS_VERSION"])
    attachments = "has_one_attached :school_photo\n  has_many_attached :hats"
  end

  file "app/models/wizard.rb", <<~RUBY
    class Wizard < ApplicationRecord
      validates :name, length: { minimum: 5 }, presence: true

      enum house: {
        Gryffindor: 0,
        Hufflepuff: 1,
        Ravenclaw: 2,
        Slytherin: 3,
      }

      enable_t_enum :house

      enum professor: {
        "Severus Snape": 0,
        "Minerva McGonagall": 1,
        "Pomona Sprout": 2,
        "Filius Flitwick": 3,
        "Hagrid": 4,
      }

      enum broom: {
        nimbus: 'nimbus',
        firebolt: 'firebolt',
      }, _prefix: true

      enable_t_enum :broom, strict_mode: true

      enum quidditch_position: {
        keeper: 0,
        seeker: 1,
        beater: 2,
        chaser: 3,
      }, _prefix: :quidditch

      enable_t_enum :quidditch_position, t_enum_name: "QPos"

      enum hair_color: {
        brown: 0,
        black: 1,
        blonde: 2,
      }, _suffix: :hair

      enum eye_color: {
        brown: 0,
        green: 1,
        blue: 2,
      }, _prefix: :color, _suffix: :eyes

      has_one :wand
      has_many :spell_books

      # simulate when belongs_to is optional by default
      belongs_to :school, optional: true

      scope :recent, -> { where('created_at > ?', 1.month.ago) }
      #{attachments}
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

  file "app/models/squib.rb", <<~RUBY
    class Squib < Wizard
      def is_magical
        false
      end
    end
  RUBY

  file "app/models/robe.rb", <<~RUBY
    class Robe < ApplicationRecord
      belongs_to :wizard, required: false
    end
  RUBY

  file "app/models/school.rb", <<~RUBY
    class School < ApplicationRecord
    end
  RUBY
end

def create_migrations
  migration_superclass = "ActiveRecord::Migration[#{ENV['RAILS_VERSION']}]"

  file "db/migrate/20190620000001_create_wizards.rb", <<~RUBY
    class CreateWizards < #{migration_superclass}
      def change
        create_table :wizards do |t|
          t.string :name
          t.integer :house
          t.string :parent_email
          t.text :notes

          t.timestamps null: false
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
          t.references :wizard, null: false
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
        add_column :wands, :broken_at,      :datetime, null: true
        add_column :wands, :chosen_at_date, :date
        add_column :wands, :chosen_at_time, :time
        # JSON column type is only supported on 5.2 or higher
        unless ['5.0', '5.1'].include?(ENV['RAILS_VERSION'])
          add_column :wands, :spell_history,  :json
          add_column :wands, :maker_info,     :json,    null: false, default: '{}'
        end
      end
    end
  RUBY

  file "db/migrate/20190620000005_add_broom_to_wizard.rb", <<~RUBY
    class AddBroomToWizard < #{migration_superclass}
      def change
        add_column :wizards, :broom, :string
      end
    end
  RUBY

  file "db/migrate/20190620000006_add_more_enums_to_wizard.rb", <<~RUBY
    class AddMoreEnumsToWizard < #{migration_superclass}
      def change
        add_column :wizards, :quidditch_position, :integer
        add_column :wizards, :hair_color, :integer
        add_column :wizards, :eye_color, :integer
        add_column :wizards, :hair_length, :integer
      end
    end
  RUBY

  file "db/migrate/20190620000007_add_type_to_wizard.rb", <<~RUBY
    class AddTypeToWizard < #{migration_superclass}
      def change
        add_column :wizards, :type, :string, null: false, default: 'Wizard'
      end
    end
  RUBY

  file "db/migrate/20190620000008_add_robe_to_wizard.rb", <<~RUBY
    class AddRobeToWizard < #{migration_superclass}
      def change
        create_table :robes do |t|
          t.references :wizard
        end
      end
    end
  RUBY

  file "db/migrate/20190620000009_add_school.rb", <<~RUBY
    class AddSchool < #{migration_superclass}
      def change
        create_table :schools do |t|
          t.string :name
        end
        add_column :wizards, :school_id, :integer
        add_foreign_key :wizards, :schools
      end
    end
  RUBY
end

def create_mailers
  file "app/mailers/hogwarts_acceptance_mailer.rb", <<~RUBY
    class HogwartsAcceptanceMailer < ApplicationMailer
      extend T::Sig

      sig { params(student: Wizard).void }
      def notify(student)
        # TODO: mail acceptance letter to student
      end

      def notify_retry(student)
        # TODO: send more owls!!
      end
    end
  RUBY

  file "app/mailers/daily_prophet_mailer.rb", <<~RUBY
    class DailyProphetMailer < ApplicationMailer
      extend T::Sig

      sig { params(wizards: T::Array[Wizard], hotnews_only: T::Boolean).void }
      def notify_subscribers(wizards:, hotnews_only:)
        # TODO: mail the latest news to wizards!
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

if ['5.0'].include?(ENV["RAILS_VERSION"])
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
  add_environment
  create_initializers
  create_lib
  create_helpers
  create_models
  create_migrations
  create_mailers
  add_sorbet_test_files

  Bundler.with_clean_env do
    run "bundle exec rake db:migrate"
  end

  if ENV["RUN_WITH_SORBET"] != 'false'
    Bundler.with_clean_env do
      run "SRB_YES=true bundle exec srb init"
      run "bundle exec rake rails_rbi:all"
      run "bundle exec srb rbi hidden-definitions"
      run "bundle exec srb rbi todo"
    end
  end
  say "Done!"
end
