class RecipesController < ApplicationController

  def index
    if params[:search]
      @recipes = EdamamApiWrapper.search_recipes(params[:search])
    end
  end

  def show
  end

end
