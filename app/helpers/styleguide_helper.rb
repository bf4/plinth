require 'coderay'

module StyleguideHelper

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

  def nav_link(text, path)
    classes = ""
    classes += "is-active" if path.include? controller.controller_name 
    content_tag :li,  link_to( text, path), class: classes
  end

  def sassie_stylesheets(file)
    ie_stylesheet = stylesheet_link_tag file + '-old-ie'
    non_ie_stylesheet = stylesheet_link_tag file

    "<!--[if lte IE 8]>#{ie_stylesheet}<![endif]-->\n<!--[if gt IE 8]><!-->#{non_ie_stylesheet}<!--<![endif]-->".html_safe
  end

end
