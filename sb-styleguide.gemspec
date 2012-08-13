# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sb-styleguide/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Taylor", "Vincent Siebert"]
  gem.email         = ["ad@adtaylor.co.uk", "vincent@siebert.im"]
  gem.description   = %q{styleguide}
  gem.summary       = %q{styleguide} 
  gem.homepage      = "https://github.com/thebeansgroup/sb-styleguide"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sb-styleguide"
  gem.require_paths = ["lib"]
  gem.version       = Sb::Styleguide::VERSION

  gem.add_development_dependency 'middleman', '~>3.0.0'
end
