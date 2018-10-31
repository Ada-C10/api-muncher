class RecipesController < ApplicationController
  def index
    @search = search_params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@search).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    # if params[:label] does not match the actual 
    @recipe = EdamamApiWrapper.recipe_details(params[:query])
  end

  private
  def search_params
    params.permit(:search)
  end
end
