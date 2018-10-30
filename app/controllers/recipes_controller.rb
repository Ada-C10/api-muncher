class RecipesController < ApplicationController
  # What methods do we need?
  # New for new search? - Make this root?
  # Create to run the search/redirect to a list page?
  # List for custom route to show list of recipes
  # Show to show individual recipes
  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search_terms])
  end

  def new
  end

  def create
  end

  def show
    # Click on a link
    # Go to show page
    # Need acess to the URI for that recipe

  end
end
