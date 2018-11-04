class SearchesController < ApplicationController

  def new
    # @recipe = EdamamApiWrapper.new
  end

  def create
    @recipe = EdamamApiWrapper.create_recipe(api_params)
  end

  def index
    #search results
    @recipes = EdamamApiWrapper.search_recipes(query)
  end

  def show
    @recipe = EdamamApiWrapper.find_by(uri: recipe.uri)
    if @recipe.nil?
      head :not_found
    end
    #single search result - single recipe
    #something goes here
  end
end
