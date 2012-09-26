SbStyleguide::Application.routes.draw do
  


  #
  # Temp root to start project
  #
  
  root :to => "ui#index"



  # 
  # UI roots
  #

  get "ui/grids", :as => "grids"
  get "ui/typography", :as => "typography"
  get "ui/buttons", :as => "buttons"
  get "ui/labels", :as => "labels"

  # Modules
  get "ui/tabs", :as => "tabs"
  get "ui/nav", :as => "nav"
  get "ui/alert", :as => "alert"
  get "ui/forms", :as => "forms"


  #
  # Javascript roots
  #

  
  get "javascripts/index", :as => "javascript"

  # 
  # External roots
  #

  match "/github"  => redirect("http://github.com/thebeansgroup/sb-styleguide"), :as => "github"
end
