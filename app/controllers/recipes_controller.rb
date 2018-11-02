class RecipesController < ApplicationController

  before_action :valid_search?, only: [:index]

  def search
  end

  def index
    if @valid_search
      flavor = params[:search]
      @recipes = RecipeSearchApiWrapper.get_recipes(flavor)
      # fail
    end
  end

  def show
  end

  private

  def valid_search?
    @valid_search = params[:search] && params[:search] != ""
  end

end
