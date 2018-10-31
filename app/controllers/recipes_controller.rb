class RecipesController < ApplicationController

  def index

  end

  def search

  end

  def results
    @query = params[:query]

    @recipes = EdamamApiWrapper.search_recipes(@query)

  end

  def show
  end
end
