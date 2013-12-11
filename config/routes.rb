Plinth::Application.routes.draw do
  
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

  get "modules" => "modules#tabs", as: "modules"
  get "modules/alerts", as: "modules_alerts"
  get "modules/footer", as: "modules_footer"
  get "modules/nav", as: "modules_nav"
  get "modules/panels", as: "modules_panels"
  get "modules/tabs", as: "modules_tabs"

  #
  # Base
  #

  get "base" => "base#index", as: "base"
  get "base/lists", as: "base_lists"
  get "base/labels", as: "base_labels"
  get "base/buttons", as: "base_buttons"
  get "base/forms", as: "base_forms"
  get "base/images", as: "base_images"
  get "base/webfonts", as: "base_webfonts"
 
  #
  # Grids
  #

  get "grids" => "grids#index", as: "grid"
  get "grids/settings", as: "grid_settings"
  get "grids/layouts", as: "grid_layouts"
  get "/grids/layouts/:id" => "grids#show", as: "grid_layout"
  #
  # Temp root to start project
  #
  
  root :to => "base#index"

  #
  # Javascripts
  #

  get "/javascripts/index.html" => redirect('/javascripts/index.html') , as: "javascripts"


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

  get "/github"  => redirect("http://github.com/thebeansgroup/plinth"), :as => "github"
end
