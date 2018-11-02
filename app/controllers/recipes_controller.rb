class RecipesController < ApplicationController

  def index
    search_term = params[:search_term]
    @recipes = EdamamApiWrapper.list_recipes(search_term)

  end

  def search_splash

  end

  def searcher
    # TODO: add flash messages
    if params[:search_term]
      redirect_to recipes_path(search_term: params[:search_term])
    else
      redirect_to root_path
    end
  end

  def show
    # maybe call a method in the api wrapper to locate the recipe
    # @recipe = Recipe.find_by(name: params[:name])
  end

end
