class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:search])
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

end
