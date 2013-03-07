class BaseController < ApplicationController
  def index
    @page_title = "Base <small>type</small>"
    @page_description = "Arguably the most important section of the style guide, where the foundations of the site are set. All modules will be extended from these base styles."
    @page_nav = base_nav
  end

  def lists
    @page_title = "Base <small>lists</small>"
    @page_nav = base_nav
  end

  def buttons
    @page_title = "Base <small>Buttons</small>"
    @page_nav = base_nav
  end

  def labels
    @page_title = "Base <small>Labels</small>"
    @page_nav = base_nav
  end

  def forms
    @page_title = "Base <small>Forms</small>"
    @page_nav = base_nav
  end

  def webfonts
    @page_title = "Base <small>Web Fonts</small>"
    @page_description = "These are the web fonts that we have at our disposal. When using these fonts you should be certain they are neccessary, when you use just 1 character the user must downloaded the full font."
    @page_nav = base_nav
  end

  private 
  def base_nav
    {
      "Type" => base_path,
      "Lists" => base_lists_path,
      "Labels" => base_labels_path,
      "Buttons" => base_buttons_path,
      "Forms" => base_forms_path,
      "Web Fonts" => base_webfonts_path
      }
  end

end
