class RecipeSearchController < ApplicationController
  def search
  end

  def index
    @query = params[:q]
    @recipes = EdamamApiWrapper.list_recipes(@query)
  end

  def show
  end
end
