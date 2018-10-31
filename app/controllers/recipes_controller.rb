class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:query])
  end

  def show
    @recipe =  EdamamApiWrapper.find_recipe(params[:id])
  end

  def new
    @recipe = params[:hits]
  end


end
