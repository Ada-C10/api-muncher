
class SearchController < ApplicationController

  def index
      @recipes = EdamamApiWrapper.search_recipes(params[:q]).paginate(:page => params[:page], :per_page => 10)
  end

  def new

  end

  def create
    redirect_to search_show_path(params[:q])
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
  end


end
