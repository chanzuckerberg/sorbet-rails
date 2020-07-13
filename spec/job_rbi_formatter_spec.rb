require 'rails_helper'
require 'sorbet-rails/job_rbi_formatter'

RSpec.describe SorbetRails::MailerRbiFormatter do

  it 'returns the expected rbi for a given array of helpers' do
    formatter = SorbetRails::JobRbiFormatter.new(AwardHousePointHourglasses)
    expect_match_file(
      formatter.generate_rbi,
      'expected_award_house_point_hourglasses.rbi'
    )
  end
end
