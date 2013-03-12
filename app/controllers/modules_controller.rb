class ModulesController < ApplicationController
  def index
    @page_title = "Modules"
    @page_description = "On top of the grid and the base styles, a site is built up of modules of functionality. The modules within the style guide are common and reusable and should not be overly content specific."
    @page_nav = modules_nav
  end

  def alerts
    @page_title = "Alerts <small>Module</small>"
    @page_nav = modules_nav
  end

  def footer
  end

  def nav
    @page_title = "Alerts <small>Module</small>"
    @page_nav = modules_nav
  end

  def panels
    @page_title = "Panel <small>Module</small>"
    @page_description = "Without doubt, the least exciting module we have."
    @page_nav = modules_nav
  end

  def tabs
    @page_title = "Tabs <small>Module</small>"
    @page_nav = modules_nav
  end

  private 
  def modules_nav
    {
      "Alerts" => modules_alerts_path,
      "Tabs" => modules_tabs_path,
      "Navigation" => modules_nav_path,
      "Panels" => modules_panels_path
      }
  end

end

