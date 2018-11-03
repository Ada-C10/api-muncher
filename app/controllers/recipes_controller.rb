class RecipesController < ApplicationController

  def index
    ingredient = params[:input]
    @recipes = ApiMuncherWrapper.recipes_by_ingredient(ingredient)

  end

  def show

    @uri = params[:id]
    @recipe = ApiMuncherWrapper.recipe_by_uri(@uri)

  end

end
