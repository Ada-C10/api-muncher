class RecipesController < ApplicationController
  def index
    search_term = params[:search_term] #the params come from the index form
    if !search_term.nil?
      @recipes = EdamamApiWrapper.list_recipes(search_term)
    end
    # binding.pry
    #need to add some conditions around this
  end

  def show
    # binding.pry

    @recipe = EdamamApiWrapper.find_recipe_by(params[:uri])
  end

end
