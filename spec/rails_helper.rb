require 'spec_helper'

ENV['RAILS_ENV'] = 'test'

require 'rails/all'
require 'rake'
require 'rspec/rails'
require 'sorbet-rails/railtie'
require 'rspec/expectations'

load 'sorbet-rails/tasks/rails_rbi.rake'

rails_version = ENV["RAILS_VERSION"] || "default"

rails_folder =
  case rails_version
  when "5.1.7"
    "5.1.7"
  else
    "5.2.3"
  end

TEST_DATA_FOLDER = "spec/test_data/#{rails_folder}"

require "support/#{rails_folder}/config/environment"

ActiveRecord::Migration.maintain_test_schema!

def expect_match_file(content, file_path)
  # TODO make this a custom matcher that can be shared in multiple files
  relative_path = "#{TEST_DATA_FOLDER}/#{file_path}"
  if ENV['RESET_TEST_DATA']
    FileUtils.mkdir_p(File.dirname(relative_path))
    File.write(relative_path, content)
  end
  expected_value = File.read(relative_path)
  expect(content).to eql(expected_value)
end
