class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.search(params[:search])
  end

  def show
  end

end
