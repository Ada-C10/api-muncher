class RecipesController < ApplicationController

  def root
  end

  def index
    @recipes = EdamamApiWrapper.search(params[:search])
  end

  def show
  end

end
