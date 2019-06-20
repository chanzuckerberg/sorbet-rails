require "byebug"
require "simplecov"

SimpleCov.start

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
