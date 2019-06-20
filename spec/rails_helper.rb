require 'spec_helper'

ENV['RAILS_ENV'] = 'test'

require 'rails/all'
require 'rake'
require 'rspec/rails'
require 'sorbet-rails/railtie'

load 'sorbet-rails/tasks/rails_rbi.rake'

require 'support/rails_app/config/environment'

ActiveRecord::Migration.maintain_test_schema!
