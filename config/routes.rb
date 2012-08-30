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


  #
  # Javascript roots
  #

  
  get "javascripts/index", :as => "javascript"

  # 
  # External roots
  #

  match "/github"  => redirect("http://github.com/thebeansgroup/sb-styleguide")
end
