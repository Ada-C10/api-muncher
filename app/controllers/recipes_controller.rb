class RecipesController < ApplicationController
  def index
    @search_terms = params[:q]
    @recipes = EdamamApiWrapper.list_recipes(params[:q])

    if @recipes.nil?
      flash[:warning] = "No results found"
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end
end
