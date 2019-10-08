require "byebug"
require "simplecov"

if ENV["CI"] == "true"
  require "codecov"
  SimpleCov.start
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
