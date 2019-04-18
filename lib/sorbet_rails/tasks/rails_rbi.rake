namespace :rails_rbi do

  desc 'Generate rbi for rails routes'
  task routes: :environment do
    all_routes = Rails.application.routes.routes
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    file_path = Rails.root.join('app', 'controllers', 'routes.rbi')
    File.write(file_path, inspector.format(RoutesRbiFormatter.new))
  end
end
