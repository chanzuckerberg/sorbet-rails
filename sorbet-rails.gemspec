Gem::Specification.new do |s|
  s.name          = %q{sorbet-rails}
  s.version       = "0.1.3"
  s.date          = %q{2019-04-18}
  s.summary       = %q{Set of tools to make Sorbet work with Rails seamlessly.}
  s.authors       = ["Chan Zuckerberg Initiative"]
  s.email         = "opensource@chanzuckerberg.com"
  s.homepage      = "https://github.com/chanzuckerberg/sorbet-rails"
  s.license       = 'MIT'
  s.require_paths = ["lib"]
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files    = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(test|spec|features)/}) }
  end

  # Development
  s.add_development_dependency 'rspec', '~> 3.8', '>= 3.8'
  # Debugging
  s.add_development_dependency 'awesome_print', '~>1.8.0', '>=1.8.0'
  s.add_development_dependency 'byebug', '~>11.0.1', '>=11.0.1'

  # for testing a gem with a rails app (controller specs)
  s.add_development_dependency 'bundler', '>=1.3.0'
  s.add_development_dependency 'rspec-rails', '>=3.8.2'
  s.add_development_dependency 'sqlite3', '>=1.4.1'
  s.add_development_dependency 'puma', '>=3.12.1'
  s.add_development_dependency 'listen', '>=3.1.5'
end
