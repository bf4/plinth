require 'coderay'

module ApplicationHelper

  def example
    capture_haml do
      haml_tag :div, :class => "sg-example"  do
        yield
      end
    end
  end

  def example( section, partial )
    contents = File.open(Rails.root.join("app/views/parts/#{section}/_#{partial}.haml")).read
    haml_contents = Haml::Engine.new(contents).render
    code_contents = CodeRay.scan( contents , :haml).div(:line_numbers => :table)
    "<div><div class='sg-example'>#{haml_contents}</div>#{code_contents}</div>".html_safe
  end
end
