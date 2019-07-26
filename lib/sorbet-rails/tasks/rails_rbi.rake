require("sorbet-rails/application_rbi_formatter")
require("sorbet-rails/model_rbi_formatter")
require("sorbet-rails/routes_rbi_formatter")
require("sorbet-rails/helper_rbi_formatter")
require("sorbet-rails/utils")

# this is ugly but it's a way to get the current directory of this script
# maybe someone coming along will know a better way
@@sorbet_rails_rake_dir = File.dirname(__FILE__)

namespace :rails_rbi do

  desc "Generate rbis for rails application"
  task application: :environment do |t, args|
    rails_application_class_name = Rails.application.class.name
    formatter = ApplicationRbiFormatter.new(rails_application_class_name)
    file_path = Rails.root.join("sorbet", "rails-rbi", "application.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, formatter.generate_rbi)
  end

  desc "Generate rbis for rails routes"
  task :routes, [:root_dir] => :environment do |t, args|
    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    root_dir = args[:root_dir] || Rails.root
    file_path = Rails.root.join("sorbet", "rails-rbi", "routes.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, inspector.format(RoutesRbiFormatter.new))
  end

  desc "Generate rbis for rails models. Pass models name to regenerate rbi for only the given models."
  task models: :environment do |t, args|
    SorbetRails::Utils.rails_eager_load_all!

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

  desc "Generate rbis for rails helpers."
  task helpers: :environment do |t, args|
    SorbetRails::Utils.rails_eager_load_all!

    if ApplicationController.methods.include?(:modules_for_helpers)
      helpers = ApplicationController.modules_for_helpers([:all])
    end

    # If ApplicationController doesn't work or doesn't return any helpers,
    # use ActionController::Base.
    if ActionController::Base.methods.include?(:modules_for_helpers) && (helpers.length == 0 || helpers.nil?)
      helpers = ActionController::Base.modules_for_helpers([:all])
    end

    formatter = HelperRbiFormatter.new(helpers)
    file_path = Rails.root.join("sorbet", "rails-rbi", "helpers.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, formatter.generate_rbi)
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
    if Object.const_defined?('ActiveRecord::SchemaMigration')
      # In Rails 6.0, there are dynamically created SchemaMigration classes like primary::SchemaMigration, etc.
      # We ignore them because Sorbet cannot typecheck those classes and it's unlikely anyone use
      # them in code.
      # https://github.com/rails/rails/blob/7cc27d749c3563e6b278ad01d233cb92ea3b7935/activerecord/lib/active_record/connection_adapters/abstract_adapter.rb#L170
      blacklisted_models.concat(ActiveRecord::SchemaMigration.descendants)
    end
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
