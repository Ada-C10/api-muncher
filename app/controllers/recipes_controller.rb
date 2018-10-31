class RecipesController < ApplicationController
  def show
    @recipe.find_by()
  end

  def list
    if params[:search]
      @search = params[:search]
      @recipes = EdamamApiWrapper.list_recipes(@search)
    else
      @recipes = []
    end
  end

end
