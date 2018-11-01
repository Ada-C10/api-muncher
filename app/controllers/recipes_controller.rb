class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_recipes
  end

  def new
    #@recipe = params[:recipe]
  end

  def create
  end
end
