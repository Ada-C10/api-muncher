class RecipesController < ApplicationController
  def index
    @search_term = params[:recipes]
    @recipes = EdamamApiWrapper.search(params[:recipes]).paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @recipe = params[:keyword]
  end

  def create
    redirect_to recipes_path(params[:keyword])
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:recipe])
    if @recipe.diet_labels == []
      @recipe.diet_labels << "N/A"
    end
  end
end
