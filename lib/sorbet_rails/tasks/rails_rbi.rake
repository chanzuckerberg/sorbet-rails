require('sorbet_rails/models_rbi_formatter')
require('sorbet_rails/routes_rbi_formatter')

namespace :rails_rbi do

  desc 'Generate rbi for rails routes'
  task routes: :environment do
    all_routes = Rails.application.routes.routes
    require 'action_dispatch/routing/inspector'
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    file_path = Rails.root.join('app', 'controllers', 'routes.rbi')
    File.write(file_path, inspector.format(RoutesRbiFormatter.new))
  end

  desc 'Generate rbi for rails models'
  task models: :environment do
    # need to eager load to see all models
    Rails.application.eager_load!
    all_models = ApplicationRecord.descendants
    file_path = Rails.root.join('app', 'models', 'models.rbi')
    File.write(file_path, ModelsRbiFormatter.new(all_models).generate_rbi)
  end

  desc 'Generate rbi for a test model'
  task test_models: :environment do |t, args|
    all_models = args.extras.map { |m| Object.const_get(m) }
    file_path = Rails.root.join('app', 'models', 'test_model.rbi')
    File.write(file_path, ModelsRbiFormatter.new(all_models).generate_rbi)
  end
end
