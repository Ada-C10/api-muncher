class RecipesController < ApplicationController
  def index
    food_to_search = params[:food_type]
    @food_to_search = food_to_search
    @matching_recipes = EdamamApiWrapper.find_recipe(food_to_search)
  end
end
