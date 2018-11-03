class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:search])
  end

  def show
  end

end
