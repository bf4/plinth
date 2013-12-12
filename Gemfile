source 'https://rubygems.org'

# Declare your gem's dependencies in plinth.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec :development_group => :dev


#
# Gems used only for assets and not required in production environments by default.
#

gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem "compass-rails", "~> 1.1.2"
gem 'uglifier', '>= 1.3.0'

#
# Use haml for templates & generators
#

gem "haml"
gem "haml-rails"
gem 'kramdown'
gem 'kramdown-haml'
gem 'thin'
gem 'formtastic', '~> 2.3.0.rc2'
gem 'rb-readline'

#
# Jquery rails - @TODO Is this needed?
#

gem 'jquery-rails'


#
# Javascript Testing
#

group :development, :test, :staging do
  gem 'growl'
  gem 'jasminerice', :git => "https://github.com/bradphelan/jasminerice"
  gem "guard-jasmine"
  # gem 'jsPercolator', :git => "git@github.com:adtaylor/jsPercolator.git"
  gem 'rails', '4.0.1'
  gem "capistrano"
  gem "aws-sdk"
  gem "net-sftp", "~> 2.1.1"
  gem "haml-coderay"
  gem "foreman"
end
