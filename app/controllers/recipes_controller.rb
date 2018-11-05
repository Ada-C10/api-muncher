class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:query])
  end

  def show
  end
end
