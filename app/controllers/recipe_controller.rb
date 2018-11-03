class RecipeController < ApplicationController
  def search
    @recipes = EdamamApiWrapper.list_recipes
  end

  def index
  end
  
  def new
    @recipe = params[:recipe]
  end


end
