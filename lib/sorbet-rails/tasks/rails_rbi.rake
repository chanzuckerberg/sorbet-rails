require("sorbet-rails/model_rbi_formatter")
require("sorbet-rails/routes_rbi_formatter")

# this is ugly but it's a way to get the current directory of this script
# maybe someone coming along will know a better way
@@sorbet_rails_rake_dir = File.dirname(__FILE__)

namespace :rails_rbi do

  desc "Generate rbi for rails routes"
  task :routes, [:root_dir] => :environment do |t, args|
    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    root_dir = args[:root_dir] || Rails.root
    file_path = Rails.root.join("sorbet", "rails-rbi", "routes.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, inspector.format(RoutesRbiFormatter.new))
  end

  desc "Generate rbi for rails models. Pass models name to regenrate rbi for only the given models."
  task models: :environment do |t, args|
    # need to eager load to see all models
    Rails.application.eager_load!
    # Rails 6.0 change the loading logic to use Zeitwerk
    # https://github.com/rails/rails/blob/master/railties/lib/rails/application/finisher.rb#L116
    # But this is not applied to Rails.application.eager_load! method
    Zeitwerk::Loader.eager_load_all if defined?(Zeitwerk)

    copy_bundled_rbi

    all_models = Set.new(ActiveRecord::Base.descendants + whitelisted_models - blacklisted_models)

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

  def copy_bundled_rbi
    bundled_rbi_path = File.join(@@sorbet_rails_rake_dir, "..", "rbi", ".")
    copy_to_path = Rails.root.join("sorbet", "rails-rbi")
    FileUtils.mkdir_p(File.dirname(copy_to_path))
    FileUtils.cp_r(bundled_rbi_path, copy_to_path)
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

  def blacklisted_models
    blacklisted_models = []
    blacklisted_models << ApplicationRecord if defined?(ApplicationRecord)
    blacklisted_models
  end

  def whitelisted_models
    # force generating these models because they aren't loaded with eager_load!
    whitelisted_models = []
    whitelisted_models << ActiveRecord::InternalMetadata if Object.const_defined?('ActiveRecord::InternalMetadata')
    whitelisted_models << ActiveRecord::SchemaMigration if Object.const_defined?('ActiveRecord::SchemaMigration')
    whitelisted_models
  end
end
