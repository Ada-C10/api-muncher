class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:query])
  end

  def show
  end

  private

  def find_recipe_uri
    @uri = EdamamApiWrapper.get_one_recipe(params[:recipe_id])
  end

end
