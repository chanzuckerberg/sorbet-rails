require 'rails_helper'
require 'open3'

RSpec.describe 'sorbet' do
  let!(:harry) do
    Wizard.create!(
      name: 'Harry Potter',
      house: :Gryffindor,
    )
  end

  before(:each) do
    Rake::Task['rails_rbi:routes'].invoke
    Rake::Task['rails_rbi:models'].invoke
  end

  it 'returns expected sorbet tc result' do
    # invoke the rake tasks
    cmd = "cd #{Rails.root.to_path}\; bundle exec srb tc"
    stdout, stderr, status = Open3.capture3(cmd)
    expect(stdout).to eql('')
    expect(status.exitstatus).to eql(1) # T.reveal_type is considered an error
    expected_file_path = 'expected_srb_tc_output.txt'
    if ENV['SORBET_VERSION']
      expected_file_path = File.join(ENV['SORBET_VERSION'], expected_file_path)
    end
    expect_match_file(stderr, expected_file_path)
  end

  it 'passes sorbet dynamic checks' do
    file_path = Rails.root.join('sorbet_test_cases.rb')
    expect {
      load(file_path)
    }.to_not raise_error
  end
end