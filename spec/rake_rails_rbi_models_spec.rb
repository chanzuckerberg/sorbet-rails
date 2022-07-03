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
        'headmaster.rbi',
        'potion.rbi',
        'robe.rbi',
        'school.rbi',
        'spell.rbi',
        'spell/habtm_spell_books.rbi',
        'spell_book.rbi',
        'spell_book/habtm_spells.rbi',
        'squib.rbi',
        'subject.rbi',
        'subject/habtm_wizards.rbi',
        'wand.rbi',
        'wizard.rbi',
        'wizard/habtm_subjects.rbi',
      ]
    )
    if Object.const_defined?('ActiveStorage')
      files = [
        'attachment.rbi',
        'blob.rbi',
      ]
      if Rails.gem_version >= Gem::Version.new('6.1.0')
        files += [
          'record.rbi',
          'variant_record.rbi',
        ]
      end
      expect_files(
        base_dir: generated_dir_path.join('active_storage'),
        files: files,
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
        'squib.rbi',
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
        'squib.rbi',
        'wizard.rbi',
      ]
    )
  end
end
