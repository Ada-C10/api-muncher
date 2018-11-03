class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:message])
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])
  end
end
