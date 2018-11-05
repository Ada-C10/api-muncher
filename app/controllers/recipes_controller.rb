class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:query])
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:recipe])

  end

  def search

  end

end
