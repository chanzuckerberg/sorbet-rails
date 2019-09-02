require 'rails_helper'
require 'sorbet-rails/mailer_rbi_formatter'

RSpec.describe SorbetRails::MailerRbiFormatter do

  it 'returns the expected rbi for a given array of helpers' do
    formatter = SorbetRails::MailerRbiFormatter.new(HogwartsAcceptanceMailer)
    expect_match_file(
      formatter.generate_rbi,
      'expected_hogwarts_acceptance_mailer.rbi'
    )
  end
end
