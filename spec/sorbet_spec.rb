require 'rails_helper'
require 'open3'

RSpec.describe 'sorbet' do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
    )
  end
  let!(:book) do
    SpellBook.create!(
      name: 'Fantastic Beasts',
      wizard: harry,
    )
  end
  let!(:wand) do
    Wand.create!(
      wizard: harry,
      core_type: :phoenix_feather,
      wood_type: "holly",
    )
  end

  before(:all) do
    if ENV['TEST_SRB_INIT']
      # only initialize sorbet once for all tests because it is slow
      stdout, stderr, status = Open3.capture3(
        {'SRB_YES' => '1'}, 'bundle', 'exec', 'srb', 'init',
        chdir: Rails.root.to_path,
      )
      # copy test case over after initializing otherwise it'll override the `typed:` indicator
      res = FileUtils.symlink(
        Rails.root.join('..', 'rails_shared', 'sorbet_test_cases.rb'),
        Rails.root.to_path,
        force: true,
      )
    end
  end

  after(:all) do
    if ENV['TEST_SRB_INIT']
      FileUtils.safe_unlink(Rails.root.join('sorbet_test_cases.rb'))
    end
  end

  before(:each) do
    Rake::Task['rails_rbi:routes'].invoke
    Rake::Task['rails_rbi:models'].invoke
    Rake::Task['rails_rbi:helpers'].invoke
  end

  it 'returns expected sorbet tc result' do
    stdout, stderr, status = Open3.capture3(
      'bundle', 'exec', 'srb', 'tc',
      chdir: Rails.root.to_path,
    )
    expect(stdout).to eql('')
    expect(status.exitstatus).to eql(1) # T.reveal_type is considered an error
    expected_file_path = 'expected_srb_tc_output.txt'
    # if ENV['SORBET_VERSION']
    #   expected_file_path = File.join(ENV['SORBET_VERSION'], expected_file_path)
    # end
    expect_match_file(stderr, expected_file_path)
  end

  it 'passes sorbet dynamic checks' do
    file_path = Rails.root.join('sorbet_test_cases.rb')
    expect {
      load(file_path)
    }.to_not raise_error
  end

  it 'runs with srb tc --lsp' do
    stdout, stderr, status = Open3.capture3(
      'bundle', 'exec', 'srb', 'tc', '--lsp',
      chdir: Rails.root.to_path,
    )
    expect(status.exitstatus).to eql(0)
  end
end
