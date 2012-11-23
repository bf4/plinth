require 'coderay'

module ApplicationHelper

def example
  capture_haml do
    haml_tag :div, :class => "sg-example"  do
      yield
    end
  end
end

end
