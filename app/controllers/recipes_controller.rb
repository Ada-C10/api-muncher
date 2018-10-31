class RecipesController < ApplicationController
  def index
    @search = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@search)
  end


  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

  def search
  end
end
