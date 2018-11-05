class RecipesController < ApplicationController
  def index
    @recipes = Kaminari.paginate_array(EdamamApiWrapper.list_recipes(params[:message])).page(params[:page]).per(10)
    #@recipes = EdamamApiWrapper.list_recipes(params[:message]).page(params[:page]).per(10)
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:uri])
  end
end
