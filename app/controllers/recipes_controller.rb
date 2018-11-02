class RecipesController < ApplicationController

  # Ruby gem: "willpaginate"
  def finder
    food_to_search = params[:food_type]
    redirect_to recipes_path(food_to_search)
  end

  def index
    @food_to_search = params[:food]
    @matching_recipes = EdamamApiWrapper.find_recipes(@food_to_search)

    # Covering status codes 401, 404
    if @matching_recipes == nil
      flash[:error] = "Ooops. Something happened. Please try again."
      redirect_back(fallback_location: root_path)
    # Covering status code 200 but no recipes are returned
    elsif @matching_recipes.length == 0
      flash[:error] = "Ooops. Looks like there are no recipes for #{@food_to_search}. Please try again."
      redirect_back(fallback_location: root_path)
    # Covering status code 200 and recipes are found
    else
    end
  end

  def show
    recipe_id = params[:id]
    @specific_recipe = EdamamApiWrapper.find_specific_recipe(recipe_id)
  end
end
