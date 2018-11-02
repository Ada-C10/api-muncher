class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.search(params[:recipes])
    # raise
  end

  def new
    @recipe = params[:author]
  end

  def create
    redirect_to recipes_path(params[:author])
  end

  def show
  end
end
