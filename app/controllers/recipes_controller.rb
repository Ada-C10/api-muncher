class RecipesController < ApplicationController

  def index
    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
    # @test = Recipe.paginate(page: params[:page], per_page: 10)
  end

  def show
    @recipe = EdamamApiWrapper.list_recipe(params["id"])[0]
    @name = @recipe["label"]
    @ingredients = @recipe["ingredients"]
    @dietLabels = @recipe["dietLabels"]
    @photo = @recipe["image"]
    @creator = @recipe["source"]
    @url = @recipe["url"]
    # binding.pry
  end

end
