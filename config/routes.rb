SbStyleguide::Application.routes.draw do

  
  # get "javascript/close"
# 
#   get "javascript/forms"
# 
#   get "javascript/ga-events"
# 
#   get "javascript/responsive-resize"
# 
#   get "javascript/switch"

  #
  # Modules
  #

  match "modules" => "modules#index", as: "modules"
  get "modules/alerts", as: "modules_alerts"
  get "modules/footer", as: "modules_footer"
  get "modules/nav", as: "modules_nav"
  get "modules/panels", as: "modules_panels"
  get "modules/tabs", as: "modules_tabs"

  #
  # Base
  #

  match "base" => "base#index", as: "base"
  get "base/lists", as: "base_lists"
  get "base/labels", as: "base_labels"
  get "base/buttons", as: "base_buttons"
  get "base/forms", as: "base_forms"
  get "base/webfonts", as: "base_webfonts"
 
  #
  # Grids
  #

  match "grids" => "grids#index", as: "grid"
  get "grids/settings", as: "grid_settings"
  get "grids/layouts", as: "grid_layouts"
  match "/grids/layouts/:id" => "grids#show", as: "grid_layout"
  #
  # Temp root to start project
  #
  
  root :to => "base#index"

  #
  # Javascripts
  #

  match "/javascripts/index.html" => redirect('/javascripts/index.html') , as: "javascripts"


  # 
  # UI roots
  #

  get "ui/grids", :as => "oldgrids"
  get "ui/typography", :as => "oldtypography"
  get "ui/buttons", :as => "oldbuttons"
  get "ui/labels", :as => "oldlabels"

  # Modules
  get "ui/tabs", :as => "oldtabs"
  get "ui/nav", :as => "oldnav"
  get "ui/alert", :as => "oldalert"
  get "ui/forms", :as => "oldforms"
  get "ui/footer", :as => "oldfooter"



  # 
  # External roots
  #

  match "/github"  => redirect("http://github.com/thebeansgroup/sb-styleguide"), :as => "github"
end
