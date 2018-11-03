class SearchController < ApplicationController

  def new
  end

  def create
    # list_recipes = q(params[:keyword])
    redirect_to search_index_path(params[:keyword])
  end

  def index
    @recipes = EdamamApiWrapper.search(params[:keyword])
    # binding.pry
  end

  def show
# binding.pry
    @recipe = EdamamApiWrapper.show_recipe(params[:recipe])
  end


end
