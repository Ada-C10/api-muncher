class SearchController < ApplicationController
  def index
    #search results
    @searches = EdamamApiWrapper.search_recipes(query)
  end

  def searchbar
    #search bar
    #make a new what?
  end

  def show
    #single search result - single recipe
    #something goes here
  end
end
