require 'rails_helper'
require 'sorbet-rails/helper_rbi_formatter'

RSpec.describe SorbetRails::HelperRbiFormatter do

  it 'returns the expected rbi for a given array of helpers' do
    formatter = SorbetRails::HelperRbiFormatter.new([BarHelper, BazHelper, FooHelper])
    expect_match_file(
      formatter.generate_rbi,
      'expected_helpers.rbi'
    )
  end
end
