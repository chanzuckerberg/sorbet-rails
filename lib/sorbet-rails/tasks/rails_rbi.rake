require("sorbet-rails/active_record_rbi_formatter")
require("sorbet-rails/model_rbi_formatter")
require("sorbet-rails/routes_rbi_formatter")
require("sorbet-rails/helper_rbi_formatter")
require("sorbet-rails/mailer_rbi_formatter")
require("sorbet-rails/job_rbi_formatter")
require("sorbet-rails/utils")

RAILS_RBI_RAKE_DIR  = File.dirname(__FILE__)

namespace :rails_rbi do
  desc "Generate rbis for rails models, routes, and helpers."
  task :all, :environment do |t, args|
    # reset rails-rbi folder
    rails_rbi_root_path = Rails.root.join("sorbet", "rails-rbi")
    FileUtils.rm_rf(rails_rbi_root_path)

    # run all rake tasks
    Rake::Task[rails_rbi_task_name(t, 'routes')].invoke
    Rake::Task[rails_rbi_task_name(t, 'models')].invoke
    Rake::Task[rails_rbi_task_name(t, 'helpers')].invoke
    Rake::Task[rails_rbi_task_name(t, 'mailers')].invoke
    Rake::Task[rails_rbi_task_name(t, 'jobs')].invoke
    Rake::Task[rails_rbi_task_name(t, 'custom')].invoke
  end

  desc "Generate rbis for rails routes"
  task :routes, [:root_dir] => :environment do |t, args|
    # Skip ActionDispatch if not included
    next unless defined?(ActionDispatch)

    all_routes = Rails.application.routes.routes
    require "action_dispatch/routing/inspector"
    inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
    root_dir = args[:root_dir] || Rails.root
    file_path = Rails.root.join("sorbet", "rails-rbi", "routes.rbi")
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, inspector.format(SorbetRails::RoutesRbiFormatter.new))
  end

  desc "Copy custom rbis for typed_params, pluck_to_struct, etc."
  task custom: :environment do |t, args|
    copy_bundled_rbi('type_assert.rbi')
    copy_bundled_rbi('pluck_to_tstruct.rbi')
    copy_bundled_rbi('typed_params.rbi')
    copy_bundled_rbi('typed_enum.rbi')

    # These files were previously bundled_rbi but are now generated so this
    # is needed for backwards compatibility with anyone using `rails_rbi:custom`
    Rake::Task[rails_rbi_task_name(t, 'active_record')].invoke
  end

  desc "Generate rbis for rails active_record base"
  task :active_record, [:root_dir] => :environment do |t, args|
    formatter = SorbetRails::ActiveRecordRbiFormatter.new
    FileUtils.mkdir_p(Rails.root.join("sorbet", "rails-rbi"))

    file_path = Rails.root.join("sorbet", "rails-rbi", "active_record_base.rbi")
    File.write(file_path, formatter.generate_active_record_base_rbi)

    file_path = Rails.root.join("sorbet", "rails-rbi", "active_record_relation.rbi")
    File.write(file_path, formatter.generate_active_record_relation_rbi)
  end

  desc "Generate rbis for rails models. Pass models name to regenerate rbi for only the given models."
  task models: :environment do |t, args|
    # Skip ActiveRecord if not included
    next unless defined?(ActiveRecord)

    SorbetRails::Utils.rails_eager_load_all!

    all_models = Set.new(ActiveRecord::Base.descendants + whitelisted_models - blacklisted_models)

    models_to_generate = all_models
    if args.extras.size > 0
      models_to_generate = args.extras.map { |m| Object.const_get(m) }
      # also generate descendants of a model
      models_to_generate = models_to_generate.
        map { |m| [m, m.descendants] }.
        flatten.
        uniq
      # be safe about ignoring blacklisted models
      models_to_generate = models_to_generate - blacklisted_models
    end

    available_class_names = Set.new(all_models.map { |c| c.name })
    models_to_generate.each do |model_class|
      model_class_name = model_class.to_s
      begin
        formatter = SorbetRails::ModelRbiFormatter.new(model_class, available_class_names)
        file_path = Rails.root.join("sorbet", "rails-rbi", "models", "#{model_class_name.underscore}.rbi")
        FileUtils.mkdir_p(File.dirname(file_path))
        File.write(file_path, formatter.generate_rbi)
      rescue StandardError, NotImplementedError => ex
        puts "---"
        puts "Error when handling model #{model_class_name}: #{ex}"
        nil
      end
    end
  end

  desc "Generate rbis for rails helpers."
  task helpers: :environment do |t, args|
    # Skip ActionController if not included
    next unless defined?(ActionController)

    SorbetRails::Utils.rails_eager_load_all!

    # API controller does not include ActionController::Helpers
    if ApplicationController < ActionController::Helpers
      helpers = ApplicationController.modules_for_helpers([:all])
    end

    # If ApplicationController doesn't work or doesn't return any helpers,
    # try using ActionController::Base.
    if ApplicationController < ActionController::Helpers && helpers.blank?
      helpers = ActionController::Base.modules_for_helpers([:all])
    end

    if helpers.blank?
      puts 'No helpers found.'
    else
      formatter = SorbetRails::HelperRbiFormatter.new(helpers)
      file_path = Rails.root.join("sorbet", "rails-rbi", "helpers.rbi")
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, formatter.generate_rbi)
    end
  end

  desc "Generate rbis for rails mailers"
  task :mailers, [:root_dir] => :environment do |t, args|
    # Skip ActiveRecord if not included
    next unless defined?(ActionMailer)

    SorbetRails::Utils.rails_eager_load_all!
    all_mailers = ActionMailer::Base.descendants

    all_mailers.each do |mailer_class|
      file_path = Rails.root.join(
        "sorbet",
        "rails-rbi",
        "mailers",
        "#{mailer_class.name.underscore}.rbi",
      )
      formatter = ::SorbetRails.config.mailer_generator_class.new(mailer_class)
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, formatter.generate_rbi)
    end
  end

  desc "Generate rbis for rails mailers"
  task :jobs, [:root_dir] => :environment do |t, args|
    # Skip ActiveJob if not included
    next unless defined?(ActiveJob)

    SorbetRails::Utils.rails_eager_load_all!
    all_jobs = ActiveJob::Base.descendants

    all_jobs.each do |job_class|
      file_path = Rails.root.join(
        "sorbet",
        "rails-rbi",
        "jobs",
        "#{job_class.name.underscore}.rbi",
      )
      formatter = ::SorbetRails.config.job_generator_class.new(job_class)
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, formatter.generate_rbi)
    end
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

  def copy_bundled_rbi(filename)
    puts "Copy bundled file #{filename}"
    bundled_rbi_file_path = File.join(RAILS_RBI_RAKE_DIR, "..", "..", "bundled_rbi", filename)
    copy_to_path = Rails.root.join("sorbet", "rails-rbi", filename)
    FileUtils.mkdir_p(File.dirname(copy_to_path))
    FileUtils.cp(bundled_rbi_file_path, copy_to_path)
  end

  def rails_rbi_task_name(current_task, target_task_suffix)
    current_task.to_s.sub(/\w+$/, target_task_suffix)
  end
end
