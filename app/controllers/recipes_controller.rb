class RecipesController < ApplicationController
  def index
    # raise
    @search_term = params[:recipes]
    @recipes = EdamamApiWrapper.search(params[:recipes]).paginate(:page => params[:page], :per_page => 10)

    # raise
  end

  def new
    # @recipe = params[:author]
      # raise
  end

  def create
    redirect_to recipes_path(params[:author])
  end

  def show
# (params[:recipe].id)
    @recipe = EdamamApiWrapper.show_recipe(params[:recipe])
    if @recipe.diet_labels == []
      @recipe.diet_labels << "N/A"
    end
  end
end
