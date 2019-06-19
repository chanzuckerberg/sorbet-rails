require 'rails_helper'
require 'sorbet-rails/routes_rbi_formatter'

RSpec.describe RoutesRbiFormatter do
  it 'sets up Rails Application' do
    expect(Rails.application.routes).to_not be_empty
  end
end
