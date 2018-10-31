class RecipesController < ApplicationController
  def index
    if !params[:search_term].nil?
      @recipes = EdamamApiWrapper.list_recipes(params[:search_term])
    end
    # binding.pry
  end

  def show
  end

end
