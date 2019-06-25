require 'rails_helper'
require 'sorbet-rails/model_rbi_formatter'

RSpec.describe ModelRbiFormatter do

  def expect_match_file(content, file_path, save_to_file: false)
    # TODO make this a custom matcher that can be shared in multiple files
    if save_to_file
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, content)
    end
    expected_value = File.read(file_path)
    expect(content).to eql(expected_value)
  end

  it 'loads all the models in the app' do
    Rails.application.eager_load!
    all_models = ActiveRecord::Base.descendants.sort_by(&:name)
    expect(all_models).to eql([
      ActiveRecord::SchemaMigration,
      ApplicationRecord,
      SpellBook,
      Wand,
      Wizard,
    ])
  end

  it 'does not throw an error when given an abstract class' do
    formatter = ModelRbiFormatter.new(ApplicationRecord, ['ApplicationRecord'])
    expect(formatter.generate_rbi).to_not raise_error
  end

  it 'generates correct rbi file for Wizard' do
    formatter = ModelRbiFormatter.new(Wizard, ['Wizard', 'Wand', 'SpellBook'])
    expect_match_file(
      formatter.generate_rbi,
      'spec/test_data/models/expected_wizard.rbi',
    )
  end

  it 'generates strict belongs_to and do not generate overridden methods' do
    formatter = ModelRbiFormatter.new(Wand, ['Wizard', 'Wand', 'SpellBook'])
    expect_match_file(
      formatter.generate_rbi,
      'spec/test_data/models/expected_wand.rbi',
    )
  end

  context 'there is a hidden model' do
    it 'fallbacks to use ActiveRecord::Relation' do
      formatter = ModelRbiFormatter.new(Wizard, ['Wizard', 'Wand'])
      expect_match_file(
        formatter.generate_rbi,
        'spec/test_data/models/expected_wizard_wo_spellbook.rbi',
      )
    end
  end
end
