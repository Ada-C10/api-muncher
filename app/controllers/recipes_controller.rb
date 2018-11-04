class RecipesController < ApplicationController

  def index
    ingredient = params[:input]
    @recipes = ApiMuncherWrapper.recipes_by_ingredient(ingredient).paginate(page: params[:page], per_page: 10)
  end

  def show
    @uri = params[:id]
    @recipe = ApiMuncherWrapper.recipe_by_uri(@uri)
  end

end
