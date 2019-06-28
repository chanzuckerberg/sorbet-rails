# For testing rake tasks
# From: https://github.com/eliotsykes/rails-testing-toolbox/blob/master/tasks.rb
# Checkout: https://www.eliotsykes.com/test-rails-rake-tasks-with-rspec

require 'rake'

# Task names should be used in the top-level describe, with an optional
# "rake "-prefix for better documentation. Both of these will work:
#
# 1) describe 'foo:bar' do ... end
#
# 2) describe 'rake foo:bar' do ... end
#
# Favor including 'rake '-prefix as in the 2nd example above as it produces
# doc output that makes it clear a rake task is under test and how it is
# invoked.
module TaskExampleGroup
  extend ActiveSupport::Concern

  included do
    let(:task_name) { self.class.top_level_description.sub(/\Arake /, '') }
    let(:tasks) { Rake::Task }
    subject(:task) { tasks[task_name] }

    after(:each) do
      task.all_prerequisite_tasks.each { |prerequisite| tasks[prerequisite].reenable }
      task.reenable

      # clean up generated dir
      rbi_dir = Rails.root.join("sorbet", "rails-rbi")
      FileUtils.remove_dir(rbi_dir) if Dir.exists?(rbi_dir)
    end
  end
end


RSpec.configure do |config|
  config.define_derived_metadata(:file_path => %r{/spec/tasks/}) do |metadata|
    metadata[:type] = :task
  end

  config.include TaskExampleGroup, type: :task

  config.before(:suite) do
    Rails.application.load_tasks
  end
end
