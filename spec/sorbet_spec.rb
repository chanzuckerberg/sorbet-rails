require 'rails_helper'
require 'open3'

RSpec.describe 'sorbet' do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
      broom: :nimbus,
      quidditch_position: :seeker,
    )
  end
  # Needed for `second!` and `third!`
  let!(:other_wizards) { 2.times { |i| Wizard.create!(name: "Wizard #{i}") } }

  let!(:book) do
    SpellBook.create!(
      name: 'Fantastic Beasts',
      wizard: harry,
      book_type: :biology,
    )
  end
  # Needed for `second!` and `third!`
  let!(:other_books) { 2.times { |i| SpellBook.create!(name: "SpellBook #{i}", wizard: harry) } }

  let!(:wand) do
    Wand.create!(
      wizard: harry,
      core_type: :phoenix_feather,
      wood_type: "holly",
      chosen_at_date: Date.parse('2019-09-01'),
      chosen_at_time: Time.parse('2019-09-01T09:00:00Z'),
      broken: true,
      broken_at: Time.parse('2019-09-05T15:30:00Z'),
    )
  end

  before(:all) do
    # only initialize sorbet once for all tests because it is slow
    stdout, stderr, status = Open3.capture3(
      {'SRB_YES' => '1'}, 'bundle', 'exec', 'srb', 'init',
      chdir: Rails.root.to_path,
    )

    if status != 0
      puts "================================="
      puts "stdout #{stdout}"
      puts "stderr #{stderr}"
      puts "srb-init doesn't produce clean build: #{status}. This will affect sorbet tests."
      puts "================================="
    end

    stdout, stderr, status = Open3.capture3(
      'bundle', 'exec', 'srb', 'tc',
      chdir: Rails.root.to_path,
    )

    # Ensure sorbet_test_cases.rb is set to `typed: true` since srb init may
    # set it to false.
    sorbet_test_cases_path = Rails.root.join('sorbet_test_cases.rb')
    File.write(sorbet_test_cases_path, File.read(sorbet_test_cases_path).gsub(/^# typed: \w+$/, "# typed: true"))

    # run sorbet-rails rake tasks
    Rake::Task['rails_rbi:all'].invoke

    # ensure we remove sorbet-rails.rbi as there are conflicts which cause srb tc to fail
    FileUtils.rm_f(Rails.root.join('sorbet/rbi/gems/sorbet-rails.rbi'))

    # Regenerate hidden-definitions because there might be conflicts between signature
    # generated by sorbet-rails & by hidden-definitions
    # They should be resolved when re-running this script
    stdout, stderr, status = Open3.capture3(
      'bundle', 'exec', 'srb', 'rbi', 'hidden-definitions',
      chdir: Rails.root.to_path,
    )

    stdout, stderr, status = Open3.capture3(
      'bundle', 'exec', 'srb', 'rbi', 'todo',
      chdir: Rails.root.to_path,
    )
  end

  it 'returns expected sorbet tc result' do
    stdout, stderr, status = Open3.capture3(
      # 'bundle', 'exec', 'srb', 'tc',
      'srb', 'tc',
      chdir: Rails.root.to_path,
    )
    expected_file_path = 'expected_srb_tc_output.txt'
    expect_match_file(stderr, expected_file_path)
    expect(stdout).to eql('')
  end

  it 'passes sorbet dynamic checks' do
    file_path = Rails.root.join('sorbet_test_cases.rb')
    expect {
      load(file_path)
    }.to_not raise_error
  end

  it 'runs with srb tc --lsp' do
    stdout, stderr, status = Open3.capture3(
      "#{`bundle show sorbet-static`.chomp}/libexec/sorbet", '--lsp',
      chdir: Rails.root.to_path,
    )
    expect(status.exitstatus).to eql(10)
  end
end
