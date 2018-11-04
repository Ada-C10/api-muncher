class SearchRecipesController < ApplicationController

  def new
  end

  def index
    if params[:search] && params[:search] != ""
      recipes = EdamamApiWrapper.find_recipes_for(params[:search])
    end

    @recipes = recipes.paginate(:page => params[:page], per_page: 10)
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

end
