class RecipesController < ApplicationController

  def finder
    food_to_search = params[:food_type]
    redirect_to recipes_path(food_to_search)
  end

  def index
    @food_to_search = params[:food]
    @matching_recipes = EdamamApiWrapper.find_recipes(@food_to_search)
  end

  def show
    recipe_id = params[:id]
    @specific_recipe = EdamamApiWrapper.find_specific_recipe(recipe_id)
  end
end
