class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes("lemon")
  end

  def show
  end

  def new
    @recipe = params[:hits]
  end

  def create
    EdamamApiWrapper.list_recipes(params[:label])
  end

end
