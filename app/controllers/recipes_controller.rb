class RecipesController < ApplicationController

  def finder
    food_to_search = params[:food_type]
    redirect_to recipes_path(food_to_search)
  end

  def index
    @food_to_search = params[:food]
    @matching_recipes = EdamamApiWrapper.find_recipe(@food_to_search)
  end
end
