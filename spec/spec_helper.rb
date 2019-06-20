require "byebug"
require "simplecov"
require 'codecov'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
