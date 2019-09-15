require 'rails_helper'

RSpec.describe 'rake rails_rbi:models', type: :task do
  let!(:generated_dir_path) { Rails.root.join("sorbet", "rails-rbi", "models") }

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates model files correctly" do
    task.invoke
    expect_files(
      base_dir: generated_dir_path,
      files: [
        'potion.rbi',
        'spell_book.rbi',
        'squib.rbi',
        'wand.rbi',
        'wizard.rbi',
      ]
    )
    if Object.const_defined?('ActiveStorage')
      expect_files(
        base_dir: generated_dir_path.join('active_storage'),
        files: [
          'attachment.rbi',
          'blob.rbi',
        ],
      )
    end
    if Object.const_defined?('ActiveRecord::InternalMetadata')
      expect_files(
        base_dir: generated_dir_path.join('active_record'),
        files: [
          'internal_metadata.rbi',
          'schema_migration.rbi',
        ]
      )
    end
  end

  it 'generates selected model correctly' do
    task.invoke("Wizard")
    expect_files(
      base_dir: generated_dir_path,
      files: [
        'wizard.rbi',
      ]
    )
  end

  it 'generates more than 1 selected models correctly' do
    task.invoke("Wizard", "SpellBook")
    expect_files(
      base_dir: generated_dir_path,
      files: [
        'spell_book.rbi',
        'wizard.rbi',
      ]
    )
  end
end
