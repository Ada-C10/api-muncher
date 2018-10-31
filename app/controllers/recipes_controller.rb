class RecipesController < ApplicationController


  def search

  end

  def results
    @query = params[:query]

    @recipes = EdamamApiWrapper.search_recipes(@query)

  end

  def show
    @recipe = params[:recipe]
  end
end
