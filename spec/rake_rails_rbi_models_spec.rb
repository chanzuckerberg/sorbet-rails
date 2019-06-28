require 'rails_helper'
require 'rake_helper'

RSpec.describe 'rake rails_rbi:models', type: :task do
  let!(:expected_dir_path) { Rails.root.join("sorbet", "rails-rbi", "models") }

  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates model files correctly" do
    task.invoke
    expect_files(
      base_dir: expected_dir_path,
      files: [
        'potion.rbi',
        'spell_book.rbi',
        'wand.rbi',
        'wizard.rbi',
      ]
    )
  end

  it 'generates selected model correctly' do
    task.invoke("Wizard")
    expect_files(
      base_dir: expected_dir_path,
      files: [
        'wizard.rbi',
      ]
    )
  end

  it 'generates more than 1 selected models correctly' do
    task.invoke("Wizard","SpellBook")
    expect_files(
      base_dir: expected_dir_path,
      files: [
        'spell_book.rbi',
        'wizard.rbi',
      ]
    )
  end

  def expect_files(base_dir:, files:)
    rbi_files = Dir[File.join(base_dir, "*.rbi")]

    # smoke test
    expect(rbi_files.size).to eql(files.size)

    # check we generate correct content
    generated_files = rbi_files.map do |file_path|
      pathname = Pathname.new(file_path)
      generated = File.read(file_path)
      # expect there is the same file in test_data folder
      path_from_dir = pathname.relative_path_from(base_dir).to_path
      expect_match_file(generated, "expected_#{path_from_dir}")
      path_from_dir
    end

    # double check we generate correct files
    expect(generated_files.sort).to eql(files)
  end
end
