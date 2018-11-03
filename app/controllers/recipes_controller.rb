class RecipesController < ApplicationController


  def finder
    food_to_search = params[:food_type]
    if food_to_search == ""
      flash[:error] = "Ooops. Looks like you forgot to enter a food type. Please try again."
      redirect_back(fallback_location: root_path)
    else
      redirect_to recipes_path(food_to_search)
    end
  end

  # Pagination on an array see: Gemfile (bottom), config/initializers/will_paginate_array_fix.rb, homepage/index.html.erb and index method
  def index
    @food_to_search = params[:food]
    recipe_list = EdamamApiWrapper.find_recipes(@food_to_search)
    @matching_recipes = recipe_list.paginate(:page => params[:page], :per_page => 10)

# <<<<<<< HEAD
    # Covering status codes 401, 404 and 200(when no recipes are found)
    if @matching_recipes == nil || @matching_recipes.length == 0
      flash[:error] = "Ooops. Looks like there are no recipes for '#{@food_to_search}'. Please try again."
      redirect_back(fallback_location: root_path)
# =======
#     # Covering status codes 401, 404
#     if recipe_list == nil
#       flash[:error] = "Ooops. Something happened. Please try again."
#       redirect_back(fallback_location: root_path)
#     # Covering status code 200 but no recipes are returned
#     elsif recipe_list.length == 0
#       flash[:error] = "Ooops. Looks like there are no recipes for #{@food_to_search}. Please try again."
#       redirect_back(fallback_location: root_path)
#     # Covering status code 200 and recipes are found
#     else
# >>>>>>> pagination
    end
  end

  def show
    recipe_id = params[:id]
    @specific_recipe = EdamamApiWrapper.find_specific_recipe(recipe_id)
  end
end
