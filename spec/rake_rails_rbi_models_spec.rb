require 'rails_helper'
require 'rake_helper'

RSpec.describe 'rake rails_rbi:models', type: :task do
  it "preloads the Rails environment" do
    expect(task.prerequisites).to include("environment")
  end

  it "generates model files correctly" do
    task.invoke

    expected_dir_path = Rails.root.join("sorbet", "rails-rbi", "models")
    rbi_files = Dir[File.join(expected_dir_path, "*.rbi")]

    # smoke test
    expect(rbi_files.size).to eql(4)

    # check we generate correct content
    generated_files = rbi_files.map do |file_path|
      pathname = Pathname.new(file_path)
      generated = File.read(file_path)
      # expect there is the same file in test_data folder
      path_from_dir = pathname.relative_path_from(expected_dir_path).to_path
      expect_match_file(generated, "expected_#{path_from_dir}")
      path_from_dir
    end

    # double check we generate correct files
    expect(generated_files.sort).to eql([
      'potion.rbi',
      'spell_book.rbi',
      'wand.rbi',
      'wizard.rbi',
    ])
  end
end
