class RecipesController < ApplicationController
  def index
    @search_terms = params[:q]
    @recipes = EdamamApiWrapper.list_recipes(params[:q])

    if @recipes.empty?
      flash[:warning] = "No results found"
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])

    if @recipe.nil?
      flash.now[:danger] = "Recipe does not exist"
      render :notfound, status: :not_found
    end
  end
end
