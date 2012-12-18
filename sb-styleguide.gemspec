# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sb-styleguide/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Taylor", "Vincent Siebert"]
  gem.email         = ["ad@adtaylor.co.uk", "vincent@siebert.im"]
  gem.description   = %q{styleguide}
  gem.summary       = %q{styleguide} 
  gem.homepage      = "https://github.com/thebeansgroup/sb-styleguide"

  gem.files         = `git ls-files`.split($\).grep(/^(?!config)/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sb-styleguide"
  gem.require_paths = ["lib"]
  gem.version       = Sb::Styleguide::VERSION

  gem.add_dependency "haml",          "~> 3.1"
  gem.add_dependency "activesupport", "~> 3.1"
  gem.add_dependency "actionpack",    "~> 3.1"
  gem.add_dependency "railties",      "~> 3.1"
  gem.add_dependency "modular-scale", "~> 1.0"
  gem.add_dependency "compass-rails"
  gem.add_dependency "sass-rails"

  gem.add_development_dependency "rails",   "~> 3.1"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "sqlite3"

end
