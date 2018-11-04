class SearchRecipesController < ApplicationController

  def index
    if params[:search] && params[:search] != ""
      recipes = EdamamApiWrapper.find_recipes_for(params[:search])
    end

    @recipes = recipes.paginate(:page => params[:page], per_page: 10)
  end

  def new
    if params[:search] && params[:search] != ""
      @recipe = params[:search]
    end
  end

  def show
    @recipe = Recipe.find_by(label: params[:label])
  end

end
