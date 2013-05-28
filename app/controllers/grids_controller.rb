class GridsController < ApplicationController
  def index
    @page_title = "Grid System<small>(s)</small>"
    @page_description = "This grid system is built to be flexible but still simple enough to read. It can scale up and down, it can fold up and it can be pushed around."
    @page_nav = grids_nav
  end

  def show
    if example_layouts.has_key? params[:id]
      render_example_layout params[:id], params[:format]
    else
      raise ActionController::RoutingError.new("Can not find example layout named: #{params[:id]}")
    end
  end

  def layouts
    @page_title = "Example Layouts."
    @page_description = "A few example layouts for experimentation"
    @page_nav = grids_nav
    @layouts = example_layouts
  end

  private 
  def grids_nav
    {
      "Grid Settings File" => grid_path +  "#Setting-Grids" ,
      "Grid Example" => grid_path + "#Live-Grid-Example" ,
      "Layouts" => grid_layouts_path
    }
  end

  def example_layouts
    {
      "basic-marketing-site" => "Basic Marketing Site",
      "jumbotron-site" => "Jumbotron Site"
    }
  end

  def render_example_layout( template, format )
    case format
    when "haml"
      render :text =>  File.open(Rails.root.join("app/views/grids/layouts/#{template}.haml")).read
    else
      render :template => "grids/layouts/#{template}.haml", :layout => false
    end
  end

end
