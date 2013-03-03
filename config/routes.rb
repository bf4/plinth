SbStyleguide::Application.routes.draw do

  get "javascript/index", as: "javascripts"
  
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
  get "modules/index", as: "module"
# 
#   get "modules/alerts"
# 
#   get "modules/footer"
# 
#   get "modules/nav"
# 
#   get "modules/panels"
# 
#   get "modules/tabs"
# 
  match "base" => "base#index", as: "base"
  get "base/lists", as: "base_lists"
# 
#   get "base/lists"
# 
#   get "base/buttons"
# 
#   get "base/labels"
# 
#   get "base/forms"
# 
#   get "base/webfonts"
# 
  get "grids/index", as: "grid"
  get "grids/settings", as: "grid_settings"
  get "grids/layouts", as: "grid_layouts"

  #
  # Temp root to start project
  #
  
  root :to => "ui#index"



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
