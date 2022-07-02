require 'spec_helper'

ENV['RAILS_ENV'] = 'test'

require 'rails/all'
require 'rake'
require 'rspec/rails'
require 'sorbet-rails/railtie'
require 'rspec/expectations'
require 'database_cleaner'

rails_version = ENV["RAILS_VERSION"] || "default"

rails_folder =
  case rails_version
  when "5.2"
    "v5.2"
  when "6.0"
    "v6.0"
  when "6.1"
    "v6.1"
  when "7.0"
    "v7.0"
  else
    "v6.0"
  end

TEST_DATA_FOLDER = "spec/test_data/#{rails_folder}"

require "support/#{rails_folder}/config/environment"

ActiveRecord::Migration.maintain_test_schema!

require 'rake_helper'

RSpec.configure do |config|
  config.before(:suite) do
    next if ENV["DISABLE_DATABASE_CLEANER"] == 'true'
    DatabaseCleaner.clean_with(:truncation, {
      pre_count: true,
      except: %w(ar_internal_metadata),
    })
  end

  config.around(:each) do |example|
    if ENV["DISABLE_DATABASE_CLEANER"] == 'true'
      example.run
      next
    end
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end

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

# File uses File::SEPARATOR by default but will also use File::ALT_SEPARATOR if it's not nil
FILE_SEPARATOR_RE = Regexp.union(*[File::SEPARATOR, File::ALT_SEPARATOR].compact).freeze

def expect_files(base_dir:, files:, expected_file_prefix: "expected")
  dirs = Set.new([base_dir])
  # if any files contain file separators then include those paths in our globbing as well
  files.each do |f|
    next unless f.match?(FILE_SEPARATOR_RE)
    dirs << File.join(base_dir, File.dirname(f))
  end

  # glob all of our dirs
  rbi_files = dirs.reduce([]) do |memo, dir|
    memo += Dir[File.join(dir, "*.rbi")]
  end

  # smoke test
  # expect(rbi_files.size).to eql(files.size)

  # check we generate correct content
  generated_files = rbi_files.map do |file_path|
    pathname = Pathname.new(file_path)
    generated = File.read(file_path)
    # expect there is the same file in test_data folder
    path_from_dir = pathname.relative_path_from(base_dir).to_path
    expect_match_file(generated, "#{expected_file_prefix}_#{path_from_dir}")
    path_from_dir
  end

  # double check we generate correct files
  expect(generated_files.sort).to eql(files)
end
