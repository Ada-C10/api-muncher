class RecipesController < ApplicationController
  def index
    if params[:recipe]
      @recipes = EdamamApiWrapper.list_recipes(params[:recipe])
    end
    # binding.pry
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :uri, :ingredients, :dietary_info)
  end
end
