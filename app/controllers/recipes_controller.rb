class RecipesController < ApplicationController
  # What methods do we need?
  # New for new search? - Make this root?
  # Create to run the search/redirect to a list page?
  # List for custom route to show list of recipes
  # Show to show individual recipes
  def index
    # Params not making it here...
    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
    binding.pry
  end

  # def home
  # end

  def show
    # Click on a link
    # Go to show page
    # Need acess to the URI for that recipe/recipe details within this show page
    # How do you find a recipe in their api?

  end

  # def new
  #   # Not sure if this works...
  #   # Should I make new the homepage?
  #   # What if it's now a new search?
  #   @recipe = params[:recipe]
  # end

  # def create
  #   # Need to send search terms to API
  #   # Then redirect to index
  #   # Need params to make it to index
  #   # EdamamApiWrapper.list_recipes(params[:search_terms])
  #
  #   redirect_to recipe_index_path
  # end
  #
  # def home
  #   @recipe = params[:recipe]
  # end


end
