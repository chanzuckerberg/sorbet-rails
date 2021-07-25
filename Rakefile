require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :update_spec do
  require 'fileutils'

  desc "Generate Rails apps for all versions."
  task :all do |t, args|
    Rake::Task['update_spec:v6_0'].invoke
    Rake::Task['update_spec:v5_2'].invoke
  end

  desc "Delete the Rails 6 spec directory and regenerate it."
  task :v6_0 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v6.0' if File.directory?('spec/support/v6.0')
      system("gem install rails -v 6.0.3")
      system("rails _6.0.3_ -v")
      system("RAILS_VERSION='6.0' rails _6.0.3_ new --template spec/generators/rails-template.rb spec/support/v6.0 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
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

  desc "Update sorbet_test_cases.rb in all the Rails apps in spec/support."
  task :sorbet_test_cases do |t, args|
    ['v6.0', 'v5.2'].each do |version|
      FileUtils.cp("spec/generators/sorbet_test_cases.rb", "spec/support/#{version}/sorbet_test_cases.rb")
    end
  end
end
