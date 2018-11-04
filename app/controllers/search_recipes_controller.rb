class SearchRecipesController < ApplicationController

  def index
    if params[:search] && params[:search] != ""
      @pagy, @recipes = pagy(EdamamApiWrapper.find_recipes_for(params[:search]), items: 10)
    end
  end

  def new
    if params[:search] && params[:search] != ""
      @recipe = params[:search]
    end
  end

  def create
  end

  def show
  end

end
