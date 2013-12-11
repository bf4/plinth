# -*- encoding: utf-8 -*-
require File.expand_path('../lib/plinth/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Taylor", "Vincent Siebert"]
  gem.email         = ["ad@adtaylor.co.uk", "vincent@siebert.im"]
  gem.description   = %q{Plinth - basic framework}
  gem.summary       = %q{Plinth is used internally at the Beans Group in order
  to facilitate speedy rollouts of new sites using similar interaction libraries
  and patterns. It also allows for rapid prototyping of products.}
  gem.homepage      = "https://github.com/thebeansgroup/plinth"

  gem.files         = `git ls-files`.split($\).grep(/^(?!config)/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "plinth"
  gem.require_paths = ["lib"]
  gem.version       = Plinth::VERSION

  gem.add_dependency "haml",          [">= 3.1", '< 4.1']
  gem.add_dependency "activesupport", [">= 3.1", '< 4.1']
  gem.add_dependency "actionpack",    [">= 3.1", '< 4.1']
  gem.add_dependency "railties",      [">= 3.1", '< 4.1']
  gem.add_dependency "modular-scale", [">= 1.0", '< 2.0']
  gem.add_dependency "compass-rails", ['>= 1.0', '< 2.0']
  gem.add_dependency "sass-rails",    ['>= 3.1', '< 4.1']
  gem.add_dependency "haml-coderay",  ['>= 0.2', '< 0.3']

  gem.add_development_dependency "rails",   [">= 3.1", '< 4.1']
  gem.add_development_dependency "bundler", ['>= 1.3', '< 2.0']
  gem.add_development_dependency "sqlite3", ['>= 1.3', '< 2.0']

end
