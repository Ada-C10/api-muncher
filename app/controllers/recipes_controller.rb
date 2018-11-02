class RecipesController < ApplicationController
  def index
    @search = params[:label]
    #@recipes = EdamamApiWrapper.list_recipes(params[:label]).paginate(:page => params[:page], :per_page => 10)
    @recipes = EdamamApiWrapper.list_recipes(params[:label])
  end

  def show
    @recipe = EdamamApiWrapper.single_recipe(params[:id])

  end

  def search
  end


  def create
  end




end
