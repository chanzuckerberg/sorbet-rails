Gem::Specification.new do |s|
  s.name          = %q{sorbet-rails}
  s.version       = "0.1.2"
  s.date          = %q{2019-04-18}
  s.summary       = %q{Set of tools to make Sorbet work with Rails seamlessly.}
  s.authors       = ["Chan Zuckerberg Initiative"]
  s.email         = "opensource@chanzuckerberg.com"
  s.homepage      = "https://github.com/chanzuckerberg/sorbet-rails"
  s.license       = 'MIT'
  s.require_paths = ["lib"]
  s.files         = Dir["lib/**/*.rb", "*.md", "LICENSE", "Gemfile"]
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  s.required_ruby_version = '>= 2.4.3'

  # Development
  s.add_development_dependency 'rspec', '~> 3.8'

  # Debugging
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'byebug'

  # for testing a gem with a rails app (controller specs)
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'listen'
end
