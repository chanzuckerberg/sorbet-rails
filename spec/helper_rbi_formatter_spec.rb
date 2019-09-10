require 'rails_helper'
require 'sorbet-rails/helper_rbi_formatter'

RSpec.describe SorbetRails::HelperRbiFormatter do
  after(:each) do
    # reset config after each test
    SorbetRails.configure do |config|
      config.extra_helper_includes = []
    end
  end

  it 'returns the expected rbi for a given array of helpers' do
    formatter = SorbetRails::HelperRbiFormatter.new([ApplicationHelper, BarHelper, BazHelper, FooHelper])
    expect_match_file(
      formatter.generate_rbi,
      'expected_helpers.rbi'
    )
  end

  it 'returns the expected rbi for a given array of helpers, with additional includes added where appropriate' do
    SorbetRails.configure do |config|
      config.extra_helper_includes = ['ApplicationHelper', 'DeviseHelper']
    end

    # ApplicationHelper won't get included in itself, but will in others. DeviseHelper will be included in all helpers.
    formatter = SorbetRails::HelperRbiFormatter.new([ApplicationHelper, BarHelper, BazHelper, FooHelper])
    expect_match_file(
      formatter.generate_rbi,
      'expected_helpers_with_application_and_devise_helpers.rbi'
    )
  end
end
