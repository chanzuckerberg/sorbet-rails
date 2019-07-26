require 'rails_helper'
require 'sorbet-rails/application_rbi_formatter'

RSpec.describe ApplicationRbiFormatter do
  it 'returns the expected rbi for an application' do
    formatter = ApplicationRbiFormatter.new('Hogwarts::Application')
    expect_match_file(
      formatter.generate_rbi,
      'expected_application.rbi'
    )
  end
end
