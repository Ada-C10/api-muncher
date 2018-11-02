class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.search_recipes(query: params[:query])
  end

  def show
  end
end
