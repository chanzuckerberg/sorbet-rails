require("sorbet-rails/model_rbi_formatter")
require("sorbet-rails/routes_rbi_formatter")

namespace :rails_rbi do

  desc "Generate rbi for rails routes"
  task routes: :environment do
    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    file_path = Rails.root.join("sorbet", "rails-rbi", "routes.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, inspector.format(RoutesRbiFormatter.new))
  end

  desc "Generate rbi for rails models. Pass models name to regenrate rbi for only the given models."
  task models: :environment do |t, args|
    # need to eager load to see all models
    Rails.application.eager_load!
    all_models = ActiveRecord::Base.descendants

    models_to_generate = args.extras.size > 0 ?
      args.extras.map { |m| Object.const_get(m) } :
      all_models

    generated_rbis = generate_rbis_for_models(models_to_generate, all_models)
    generated_rbis.each do |model_name, contents|
      file_path = Rails.root.join("sorbet", "rails-rbi", "models", "#{model_name.underscore}.rbi")
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, contents)
    end
  end

  def generate_rbis_for_models(model_classes, available_classes)
    available_class_names = Set.new(available_classes.map { |c| c.name })
    formatted = model_classes.map do |model_class|
      begin
        formatter = ModelRbiFormatter.new(model_class, available_class_names)
        [model_class.name, formatter.generate_rbi]
      rescue StandardError => ex
        puts "---"
        puts "Error when handling model #{model_class.name}: #{ex}"
        nil
      end
    end
    Hash[formatted.compact] # remove models with errors
  end
end
