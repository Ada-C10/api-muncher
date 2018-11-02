class RecipesController < ApplicationController

  def index
    # Params not making it here...
    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
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
