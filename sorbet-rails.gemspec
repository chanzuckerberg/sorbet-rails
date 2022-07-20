Gem::Specification.new do |s|
  s.name          = %q{sorbet-rails}
  s.version       = "0.7.34"
  s.date          = %q{2019-04-18}
  s.summary       = %q{Set of tools to make Sorbet work with Rails seamlessly.}
  s.authors       = ["Chan Zuckerberg Initiative"]
  s.email         = "opensource@chanzuckerberg.com"
  s.homepage      = "https://github.com/chanzuckerberg/sorbet-rails"
  s.license       = 'MIT'
  s.require_paths = ["lib"]
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|sorbet)/}) }
  end
  s.test_files    = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.add_dependency 'parlour', '>= 4.0.1'
  s.add_dependency 'sorbet-runtime', '>= 0.5.9892'
  s.add_dependency 'sorbet-coerce', '>= 0.2.6'
  s.add_dependency 'method_source', '>= 0.9.2'
  s.add_dependency 'parser', '>= 2.7'

  # Development
  s.add_development_dependency 'rspec', '~> 3.8', '>= 3.8'
  # Debugging
  s.add_development_dependency 'awesome_print', '~>1.8.0', '>=1.8.0'
  s.add_development_dependency 'byebug', '~>11.1.3', '>=11.1.3'

  # for testing a gem with a rails app (controller specs)
  s.add_development_dependency 'rspec-rails', '>=3.8.2'
  s.add_development_dependency 'puma', '>=3.12.1'
  s.add_development_dependency 'database_cleaner', '>= 1.7.0'
end
