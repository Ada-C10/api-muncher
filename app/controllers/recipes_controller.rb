class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes("cheese")
  end

  def show
  end
end
