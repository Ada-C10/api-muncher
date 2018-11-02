class SearchController < ApplicationController

  def new
    @query = params
  end

  def index
    #search results
    @recipes = EdamamApiWrapper.search_recipes(query)
  end

  def show
    search_id = params[:id]
    @recipe = EdamamApiWrapper.find_by(id: recipe_id)
    if @recipe.nil?
      head :not_found
    end
    #single search result - single recipe
    #something goes here
  end
end
