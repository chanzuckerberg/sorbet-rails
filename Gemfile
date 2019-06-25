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
  when "default"
    ">= 5.2.3"
  else
    "~> #{rails_version}"
  end

gem "rails", rails
