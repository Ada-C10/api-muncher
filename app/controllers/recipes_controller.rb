class RecipesController < ApplicationController

  def index
    @food_search = params[:food_search]
    @recipes = RecipeApiWrapper.list_recipes(@food_search)
    if @recipes == []
      flash[:status] = :not_found
          flash[:result_text] = "There were no results for your search term. Please try again"
      redirect_to root_path, status: :bad_request
    end
  end

  def show
    recipe_uri = params[:uri]

    @recipe = RecipeApiWrapper.show_recipe_detail(recipe_uri)
    if @recipe == nil
      flash[:status] = :not_found
          flash[:result_text] = "There was a problem accessing this recipe. Detail not found."
      render :index, status: :bad_request
    end
  end
end
