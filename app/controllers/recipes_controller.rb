class RecipesController < ApplicationController
  def index
    if params[:q] != nil
      @recipes = EdamamApiWrapper.list_recipes(params[:q])
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:uri])
  end
end
