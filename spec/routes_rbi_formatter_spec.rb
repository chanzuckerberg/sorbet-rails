require 'rails_helper'
require 'sorbet-rails/routes_rbi_formatter'

RSpec.describe RoutesRbiFormatter do
  it 'sets up Rails Application' do
    expect(Rails.application.routes).to_not be_empty
  end

  it 'generates _path and _url of a named route' do
    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    formatted = inspector.format(RoutesRbiFormatter.new)
    # Write the res to a file
    # file_path = '/tmp/expected_routes.rbi'
    # FileUtils.mkdir_p(File.dirname(file_path))
    # File.write(file_path, res)
    expected_value = File.read('spec/test_data/expected_routes.rbi')
    expect(formatted).to eql(expected_value)
  end
end
