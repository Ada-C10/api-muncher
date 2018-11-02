class RecipesController < ApplicationController

  before_action :valid_search?, only: [:index]

  def search
  end

  def index
    if @valid_search
      flavor = params[:search]
      recipes = RecipeSearchApiWrapper.get_recipes(flavor)
      @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
  end

  private

  def valid_search?
    @valid_search = params[:search] && params[:search] != ""
  end

end
