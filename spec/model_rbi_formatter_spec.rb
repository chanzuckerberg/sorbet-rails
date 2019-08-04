require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe SorbetRails::ModelRbiFormatter do

  it 'does not throw an error when given an abstract class' do
    formatter = SorbetRails::ModelRbiFormatter.new(Potion, Set.new(['Potion']))
    expect_match_file(
      formatter.generate_rbi,
      'expected_potion.rbi',
    )
  end

  it 'generates correct rbi file for Wizard' do
    formatter = SorbetRails::ModelRbiFormatter.new(Wizard, Set.new(['Wizard', 'Wand', 'SpellBook']))
    expect_match_file(
      formatter.generate_rbi,
      'expected_wizard.rbi',
    )
  end

  it 'generates strict belongs_to and generate overridden methods' do
    formatter = SorbetRails::ModelRbiFormatter.new(Wand, Set.new(['Wizard', 'Wand', 'SpellBook']))
    expect_match_file(
      formatter.generate_rbi,
      'expected_wand.rbi',
    )
  end

  context 'there is a hidden model' do
    it 'fallbacks to use ActiveRecord::Relation' do
      formatter = SorbetRails::ModelRbiFormatter.new(Wizard, Set.new(['Wizard', 'Wand']))
      expect_match_file(
        formatter.generate_rbi,
        'expected_wizard_wo_spellbook.rbi',
      )
    end
  end
end
