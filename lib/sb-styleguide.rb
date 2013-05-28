require "sb-styleguide/version"
require "rails"


module Sb
  module Styleguide
    class Engine < Rails::Engine
      require "modular-scale"
    end
  end
end
