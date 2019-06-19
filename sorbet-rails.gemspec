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
end
