class RecipesController < ApplicationController

  def index
    search_term = params[:search_term]
    @recipes = EdamamApiWrapper.list_recipes(search_term)

  end

  def search_splash

  end

  def searcher
    # TODO: add flash messages
    # but also do i need this to be a post? can it be a get with the params in the form?
    if params[:search_term]
      redirect_to recipes_path(search_term: params[:search_term])
    else
      redirect_to root_path
    end
  end

  def show
    # maybe call a method in the api wrapper to locate the recipe
    uri_num = params[:uri_num]
    @recipe = EdamamApiWrapper.show_single_recipe(uri_num)
  end

end
