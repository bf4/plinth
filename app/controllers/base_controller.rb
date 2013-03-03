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
  end

  def labels
  end

  def forms
  end

  def webfonts
  end

  private 
  def base_nav
    {
      "Type" => base_path,
      "Lists" => base_lists_path
      }
  end

end
