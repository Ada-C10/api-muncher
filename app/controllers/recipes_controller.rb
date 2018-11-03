class RecipesController < ApplicationController

  def index
    ingredient = params[:input]
    @recipes = ApiMuncherWrapper.recipes_by_ingredient(ingredient)
  end

end
