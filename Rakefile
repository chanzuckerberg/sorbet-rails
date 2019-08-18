require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :update_spec do
  require 'fileutils'

  # This excludes 4.2 because it won't work with Bundler 2.0
  desc "Generate Rails apps for all versions (except 4.2)."
  task :v5_plus do |t, args|
    Rake::Task['update_spec:v6_0'].invoke
    Rake::Task['update_spec:v5_2'].invoke
    Rake::Task['update_spec:v5_2_no_sorbet'].invoke
    Rake::Task['update_spec:v5_1'].invoke
    Rake::Task['update_spec:v5_0'].invoke
  end

  desc "Delete the Rails 6 spec directory and regenerate it."
  task :v6_0 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v6.0' if File.directory?('spec/support/v6.0')
      system("gem install rails -v 6.0.0")
      system("rails _6.0.0_ -v")
      system("RAILS_VERSION='6.0' rails _6.0.0_ new --template spec/generators/rails-template.rb spec/support/v6.0 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
    end
  end

  desc "Delete the Rails 5.2 spec directory and regenerate it."
  task :v5_2 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v5.2' if File.directory?('spec/support/v5.2')
      system("gem install rails -v 5.2.3")
      system("rails _5.2.3_ -v")
      system("RAILS_VERSION='5.2' rails _5.2.3_ new --template spec/generators/rails-template.rb spec/support/v5.2 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
    end
  end

  desc "Delete the Rails 5.2-no-sorbet spec directory and regenerate it."
  task :v5_2_no_sorbet do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v5.2-no-sorbet' if File.directory?('spec/support/v5.2-no-sorbet')
      system("gem install rails -v 5.2.3")
      system("rails _5.2.3_ -v")
      system("RUN_WITH_SORBET='false' RAILS_VERSION='5.2' rails _5.2.3_ new --template spec/generators/rails-template.rb spec/support/v5.2-no-sorbet --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
    end
  end

  desc "Delete the Rails 5.1 spec directory and regenerate it."
  task :v5_1 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v5.1' if File.directory?('spec/support/v5.1')
      system("gem install rails -v 5.1.7")
      system("rails _5.1.7_ -v")
      system("RAILS_VERSION='5.1' rails _5.1.7_ new --template spec/generators/rails-template.rb spec/support/v5.1 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-listen")
    end
  end

  desc "Delete the Rails 5.0 spec directory and regenerate it."
  task :v5_0 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v5.0' if File.directory?('spec/support/v5.0')
      system("gem install rails -v 5.0.7")
      system("rails _5.0.7_ -v")
      system("RAILS_VERSION='5.0' rails _5.0.7_ new --template spec/generators/rails-template.rb spec/support/v5.0 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-listen")
    end
  end

  desc "Delete the Rails 4.2 spec directory and regenerate it."
  task :v4_2 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v4.2' if File.directory?('spec/support/v4.2')
      system("gem install rails -v 4.2.11")
      system("rails _4.2.11_ -v")
      system("RAILS_VERSION='4.2' rails _4.2.11_ new --template spec/generators/rails-template.rb spec/support/v4.2 --skip-javascript --skip-test --skip-sprockets --skip-spring --skip-listen")
    end
  end

  desc "Update sorbet_test_cases.rb in all the Rails apps in spec/support."
  task :sorbet_test_cases do |t, args|
    ['v6.0', 'v5.2', 'v5.2-no-sorbet', 'v5.1', 'v5.0', 'v4.2'].each do |version|
      FileUtils.cp("spec/generators/sorbet_test_cases.rb", "spec/support/#{version}/sorbet_test_cases.rb")
    end
  end
end
