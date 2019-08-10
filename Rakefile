require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

namespace :update_spec do
  require 'fileutils'

  desc "Delete the Rails 6 spec directory and regenerate it."
  task :v6_0 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v6.0' if File.directory?('spec/support/v6.0')
      system("gem install rails -v 6.0.0.rc2")
      system("rails _6.0.0.rc2_ -v")
      system("rails _6.0.0.rc2_ new --template spec/generators/rails-6-0-template.rb spec/support/v6.0 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
    end

    puts "Done!"
  end

  desc "Delete the Rails 5.2 spec directory and regenerate it."
  task :v5_2 do |t, args|
    Bundler.with_clean_env do
      FileUtils.rm_rf 'spec/support/v5.2' if File.directory?('spec/support/v5.2')
      system("gem install rails -v 5.2.3")
      system("rails _5.2.3_ -v")
      system("rails _5.2.3_ new --template spec/generators/rails-5-2-template.rb spec/support/v5.2 --skip-javascript --skip-action-cable --skip-test --skip-sprockets --skip-spring --skip-bootsnap --skip-listen")
    end

    puts "Done!"
  end
end
