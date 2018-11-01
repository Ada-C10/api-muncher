class RecipesController < ApplicationController
  def home
  end

  def index
    @food = params[:food]

    @recipes = EdamamApiWrapper.search_recipes(@food)
    if !@recipes
      flash[:warning] = "No recipes found for #{@food}"
      redirect root, status: :not_found
    end

  end

  def show
    
  end

end
