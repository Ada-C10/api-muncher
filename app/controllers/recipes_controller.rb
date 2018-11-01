class RecipesController < ApplicationController


  def search

  end

  def results
    @query = params[:query]

    @recipes = EdamamApiWrapper.search_recipes(@query)

  end

  def show
    puts params

    uri = params[:uri]

    @recipe = EdamamApiWrapper.find_recipe(uri)
  end
end
