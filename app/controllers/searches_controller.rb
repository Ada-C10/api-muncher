require 'httparty'

class SearchesController < ApplicationController

  def root
  end

  def index
    #search results
    @recipes = EdamamApiWrapper.search_recipes( params[:recipe] )
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe( params[:id] )
  end
end
