class RecipesController < ApplicationController
  def index
    @food_search = params[:food_search]
    @recipes = RecipeApiWrapper.list_recipes
  end

  def show
    @recipe = nil
  end
end
