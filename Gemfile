source :rubygems

# Declare your gem's dependencies in sb-styleguide.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec :development_group => :dev


#
# Gems used only for assets and not required in production environments by default.
#

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.0.3'
end


#
# Use haml for templates & generators
#

gem "haml"
gem "haml-rails"
gem "haml-coderay"
gem "maruku"

#
# Jquery rails - @TODO Is this needed?
#

gem 'jquery-rails'


#
# Javascript Testing
#

group :development, :test do
  gem 'growl'
  gem 'jasminerice', :git => "https://github.com/bradphelan/jasminerice"
  gem "guard-jasmine"
  gem 'jsPercolator', :git => "git@github.com:adtaylor/jsPercolator.git"
end
