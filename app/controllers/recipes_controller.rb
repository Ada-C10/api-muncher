class RecipesController < ApplicationController
  def index
    @search_terms = params[:q]
    @recipes = EdamamApiWrapper.list_recipes(params[:q])
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])
  end
end
