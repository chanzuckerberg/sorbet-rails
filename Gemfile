source 'https://rubygems.org'

gemspec

group :test do
  gem 'simplecov', require: false
  gem 'codecov', require: false
end

rails_version = ENV["RAILS_VERSION"] || "default"

case rails_version
when "master"
  gem "rails", {github: "rails/rails"}
  gem "bundler", ">= 1.3.0"
when "4.2"
  gem "rails", "~> 4.2.11"
  gem "bundler", "~> 1.17.3"
  gem "sqlite3", "~> 1.3.6"
when "5.0"
  gem "rails", "~> 5.0.7"
  gem "bundler", ">= 2.0"
  gem "sqlite3", "~> 1.3.6"
when "5.1"
  gem "rails", "~> 5.1.7"
  gem "bundler", ">= 2.0"
  gem "sqlite3", "~> 1.4.1"
when "5.2"
  gem "rails", "~> 5.2.3"
  gem "bundler", ">= 2.0"
  gem "sqlite3", "~> 1.4.1"
when "6.0"
  gem "rails", "~> 6.0.0.rc1"
  gem "bundler", ">= 2.0"
  gem "sqlite3", "~> 1.4.1"
else
  gem "rails", ">= 5.2.3"
  gem "bundler", ">= 2.0"
  gem "sqlite3", "~> 1.4.1"
end

sorbet_version = ENV["SORBET_VERSION"]
if sorbet_version
  # mostly used to test against a stable version of Sorbet in Travis.
  gem 'sorbet', sorbet_version
  gem 'sorbet-runtime', sorbet_version
else
  # prefer to test against latest version because sorbet is updated frequently
  gem 'sorbet'
  gem 'sorbet-runtime'
end
