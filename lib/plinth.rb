require "plinth/version"
require 'sprockets/railtie'
require 'sass-rails'

module Plinth
  class Railtie < ::Rails::Railtie
    require "modular-scale"
  end
end

require 'sass/rails'
