class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:query])
  end

  def show
    if @recipe.nil?
      redirect_to recipes_path
    else
      @recipe =  EdamamApiWrapper.find_recipe(params[:id])
    end
  end

  def new
    # @recipe = params[:hits]
  end


end
