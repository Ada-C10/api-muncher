class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:label])
  end

  def show
    @recipe = EdamamApiWrapper.single_recipe(params[:id])
  
  end

  def search
  end


  def create

  end


end
