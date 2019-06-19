require 'spec_helper'

ENV['RAILS_ENV'] = 'test'

require 'rails/all'
require 'rspec/rails'

require 'support/rails_app/config/environment'

ActiveRecord::Migration.maintain_test_schema!
