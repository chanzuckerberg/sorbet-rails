require 'rails_helper'
require 'sorbet-rails/routes_rbi_formatter'

RSpec.describe SorbetRails::RoutesRbiFormatter do
  it 'sets up Rails Application' do
    expect(Rails.application.routes).to_not be_empty
  end

  it 'generates _path and _url of a named route' do
    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    formatted = inspector.format(SorbetRails::RoutesRbiFormatter.new)
    expect_match_file(formatted, 'expected_routes.rbi')
  end

  it 'generates correctly when there is no routes' do
    empty_set = ActionDispatch::Routing::RouteSet.new
    empty_set.draw do
      # no routes
    end
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(empty_set.routes)
    formatted = inspector.format(SorbetRails::RoutesRbiFormatter.new)
    expect_match_file(formatted, 'expected_no_routes.rbi')
  end
end
