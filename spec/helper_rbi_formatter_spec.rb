require 'rails_helper'
require 'sorbet-rails/helper_rbi_formatter'

RSpec.describe HelperRbiFormatter do

  it 'returns the expected rbi for a given array of helpers' do
    formatter = HelperRbiFormatter.new(['FooHelper', 'BarHelper', 'BazHelper'])
    expect_match_file(
      formatter.generate_rbi,
      'expected_helper.rbi'
    )
  end
end
