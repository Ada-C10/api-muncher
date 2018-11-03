class RecipesController < ApplicationController

  # Ruby gem: "willpaginate"
  def finder
    food_to_search = params[:food_type]
    if food_to_search == ""
      flash[:error] = "Ooops. Looks like you forgot to enter a food type. Please try again."
      redirect_back(fallback_location: root_path)
    else
      redirect_to recipes_path(food_to_search)
    end
  end

  def index
    @food_to_search = params[:food]
    @matching_recipes = EdamamApiWrapper.find_recipes(@food_to_search)

    # Covering status codes 401, 404 and 200(when no recipes are found)
    if @matching_recipes == nil || @matching_recipes.length == 0
      flash[:error] = "Ooops. Looks like there are no recipes for '#{@food_to_search}'. Please try again."
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    recipe_id = params[:id]
    @specific_recipe = EdamamApiWrapper.find_specific_recipe(recipe_id)
  end
end
