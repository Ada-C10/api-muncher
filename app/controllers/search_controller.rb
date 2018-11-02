class SearchController < ApplicationController
  def index
    #search results
<<<<<<< HEAD
    @recipes = EdamamApiWrapper.search_recipes(query)
  end

  def show
    search_id = params[:id]
    @recipe = EdamamApiWrapper.find_by(id: recipe_id)
    if @recipe.nil?
      head :not_found
    end
=======
    @searches = EdamamApiWrapper.search_recipes(query)
  end

  def searchbar
    #search bar
    #make a new what?
  end

  def show
>>>>>>> 273789d7df17bf7c77e9864cfca23e94f8566734
    #single search result - single recipe
    #something goes here
  end
end
