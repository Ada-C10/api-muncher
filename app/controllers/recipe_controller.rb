class RecipeController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.search(params[:food])
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.find_a_recipe(uri).first #takes the object out []
  end

  def home
    # @recipes = EdamamApiWrapper.search(params[:food])
  end

end
