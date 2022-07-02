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
          return_type: "T::Array[#{model_class_name}]",
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

      # habtm enforced at the DB level
      has_and_belongs_to_many :spells

      enum book_type: {
        unclassified: 0,
        biology: 1,
        dark_art: 999,
      }

      scope :recent, -> { where('created_at > ?', 1.month.ago) }
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

  file "app/models/wizard.rb", <<~RUBY
    class Wizard < ApplicationRecord
      validates :name, length: { minimum: 5 }, presence: true
      # simulate conditional validation
      validates :parent_email, presence: true, if: :Slytherin?

      typed_enum house: {
        Gryffindor: 0,
        Hufflepuff: 1,
        Ravenclaw: 2,
        Slytherin: 3,
      }

      # To create conflict with enum
      class Professor; end

      enum professor: {
        "Severus Snape": 0,
        "Minerva McGonagall": 1,
        "Pomona Sprout": 2,
        "Filius Flitwick": 3,
        "Hagrid": 4,
        "Alastor 'Mad-Eye' Moody": 5,
      }

      typed_enum broom: {
        nimbus: 'nimbus',
        firebolt: 'firebolt',
      }, _prefix: true

      typed_enum quidditch_position: {
        keeper: 0,
        seeker: 1,
        beater: 2,
        chaser: 3,
      }, _prefix: :quidditch

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

      serialize :owl_results, Hash
      serialize :newt_subjects # no specific data type, uses the default YAML Object coder
      serialize :pets, Array
      serialize :patronus_characteristics, JSON

      has_one :wand
      has_many :spell_books
      # habtm which is optional at the db level
      has_and_belongs_to_many :subjects

      # simulate when belongs_to is optional by default
      belongs_to :school, optional: true

      scope :recent, -> { where('created_at > ?', 1.month.ago) }
      has_one_attached :school_photo
      has_many_attached :hats
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
      has_one :headmaster
      validates :headmaster, presence: true
    end
  RUBY

  file "app/models/subject.rb", <<~RUBY
    class Subject < ApplicationRecord
      # habtm which is optional at the db level
      has_and_belongs_to_many :wizards
    end
  RUBY

  file "app/models/spell.rb", <<~RUBY
    class Spell < ApplicationRecord
      # habtm enforced at the DB level
      has_and_belongs_to_many :spell_books
    end
  RUBY

  file "app/models/headmaster.rb", <<~RUBY
    class Headmaster < ApplicationRecord
      belongs_to :school, required: false
      belongs_to :wizard, optional: true

      validates :school, presence: true
      validates :wizard_id, presence: true
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
          t.integer :professor
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
        add_column :wands, :spell_history,  :json
        add_column :wands, :maker_info,     :json,    null: false, default: '{}'
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

  file "db/migrate/20190620000010_add_subject.rb", <<~RUBY
    class AddSubject < #{migration_superclass}
      def change
        create_table :subjects do |t|
          t.string :name
        end
      end
    end
  RUBY

  file "db/migrate/20190620000011_add_subjects_wizards.rb", <<~RUBY
    class AddSubjectsWizards < #{migration_superclass}
      def change
        create_join_table :subjects, :wizards, column_options: { null: true } do |t|
          t.index [:subject_id, :wizard_id]
        end
      end
    end
  RUBY

  file "db/migrate/20190620000012_add_spell.rb", <<~RUBY
    class AddSpell < #{migration_superclass}
      def change
        create_table :spells do |t|
          t.string :name
        end
      end
    end
  RUBY

  file "db/migrate/20190620000013_add_spells_spell_books.rb", <<~RUBY
    class AddSpellsSpellBooks < #{migration_superclass}
      def change
        create_join_table :spells, :spell_books do |t|
          t.index [:spell_id, :spell_book_id]
        end
      end
    end
  RUBY

  file "db/migrate/20190620000014_create_headmasters.rb", <<~RUBY
    class CreateHeadmasters < #{migration_superclass}
      def change
        create_table :headmasters do |t|
          t.references :school
          t.references :wizard
        end
      end
    end
  RUBY

  file "db/migrate/20190620000015_add_serialized_to_wizards.rb", <<~RUBY
    class AddSerializedToWizards < #{migration_superclass}
      def change
        add_column :wizards, :owl_results, :text # Hash
        add_column :wizards, :newt_subjects, :text # generic
        add_column :wizards, :pets, :text # Array
        add_column :wizards, :patronus_characteristics, :text # serialized as JSON, but not a JSON column type
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

      sig {
        params(
          teacher: Wizard,
          note: String,
          student: Wizard,
          special: T::Boolean,
        ).void
      }
      def notify_teacher(
        teacher,
        note=nil,
        student:,
        special: false
      ) # TODO: let the teacher know when a students accepted offer
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

def create_jobs
  file "app/jobs/award_house_point_hourglasses.rb", <<~RUBY
    # N.B. You imagine the wizards update the point magically somehow?
    # Nope, there is a "goblin" that takes their "give points" request and do it
    # behind the scene.
    class AwardHousePointHourglasses < ApplicationJob
      extend T::Sig

      sig { params(student: Wizard, point: Integer).void }
      def perform(student:, point:)
        # TODO: award point to student's house
      end
    end
  RUBY
end

def add_sorbet_test_files
  copy_file "./sorbet_test_cases.rb", "sorbet_test_cases.rb"
end

# Get files relative to this template when copying.
def source_paths
  [__dir__]
end

# Main setup
source_paths

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
  create_jobs
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
