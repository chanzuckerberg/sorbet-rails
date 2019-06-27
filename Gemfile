source 'https://rubygems.org'

gemspec

group :test do
  gem 'simplecov', require: false
  gem 'codecov', require: false
end

rails_version = ENV["RAILS_VERSION"] || "default"

rails =
  case rails_version
  when "master"
    {github: "rails/rails"}
  when "5.1"
    "~> 5.1.7"
  when "5.2"
    "~> 5.2.3"
  else
    ">= 5.2.3"
  end

gem "rails", rails
