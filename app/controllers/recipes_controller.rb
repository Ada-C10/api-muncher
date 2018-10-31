class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.recipe_search(params[:keyword])
  end

  def show
  end

end
