require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe ModelRbiFormatter do

  it 'loads all the models in the app' do
    Rails.application.eager_load!
    all_models = ActiveRecord::Base.descendants.sort_by(&:name)
    expect(all_models).to eql([
      ActiveRecord::SchemaMigration,
      ApplicationRecord,
      Potion,
      SpellBook,
      Wand,
      Wizard,
    ])
  end

  it 'does not throw an error when given an abstract class' do
    formatter = ModelRbiFormatter.new(Potion, ['Potion'])
    expect_match_file(
      formatter.generate_rbi,
      'expected_potion.rbi',
    )
  end

  it 'generates correct rbi file for Wizard' do
    formatter = ModelRbiFormatter.new(Wizard, ['Wizard', 'Wand', 'SpellBook'])
    expect_match_file(
      formatter.generate_rbi,
      'expected_wizard.rbi',
    )
  end

  it 'generates strict belongs_to and do not generate overridden methods' do
    formatter = ModelRbiFormatter.new(Wand, ['Wizard', 'Wand', 'SpellBook'])
    expect_match_file(
      formatter.generate_rbi,
      'expected_wand.rbi',
    )
  end

  context 'there is a hidden model' do
    it 'fallbacks to use ActiveRecord::Relation' do
      formatter = ModelRbiFormatter.new(Wizard, ['Wizard', 'Wand'])
      expect_match_file(
        formatter.generate_rbi,
        'expected_wizard_wo_spellbook.rbi',
      )
    end
  end
end
