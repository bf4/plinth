class GridsController < ApplicationController
  def index
    @page_title = "Grid System<small>(s)</small>"
    @page_description = "This grid system is built to be flexible but still simple enough to read. It can scale up and down, it can fold up and it can be pushed around."
    @page_nav = grids_nav
  end

  def settings
  end

  def layouts
    @page_title = "Example Layouts."
    @page_description = "A few example layouts for experimentation"
    @page_nav = grids_nav
  end

  private 
  def grids_nav
    {
      "Grid Settings File" => "#Setting-Grids" ,
      "Grid Example" => "#Live-Grid-Example" ,
      "Layouts" => grid_layouts_path
      }
  end

end
