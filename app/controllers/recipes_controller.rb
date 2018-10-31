class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.recipe_search(params[:keyword])
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end
