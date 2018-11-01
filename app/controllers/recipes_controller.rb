class RecipesController < ApplicationController
  def index
    @search = params[:search]
    if @search.empty?
      redirect_to root_path
    else

      @recipes = EdamamApiWrapper.list_recipes(@search)
    end
  end


  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

  def search
  end

  def new
  end
end
