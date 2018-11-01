class RecipesController < ApplicationController

  def index
    # Params not making it here...
    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
  end

  def show
    @recipe = EdamamApiWrapper.list_recipe(params["id"])
    @name = @recipe[0]["label"]
    @ingredients = @recipe[0]["ingredients"]
    @dietLabels = @recipe[0]["dietLabels"]
    @photo = @recipe[0]["image"]
    @creator = @recipe[0]["sources"]
  end

end
