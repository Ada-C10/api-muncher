class RecipesController < ApplicationController
  def index
    @search = search_params

    @recipes = EdamamApiWrapper.list_recipes(@search).paginate(:page => params[:page], :per_page => 10)

    if @recipes == []
      flash[:status] = :warning
      flash[:message] = "No results for your search."
      redirect_to root_path
    end
  end

  def show
    @recipe = EdamamApiWrapper.recipe_details(params[:id])
    if @recipe == nil
      flash[:status] = :warning
      flash[:message] = "This recipe does not exist."
      redirect_to root_path
    end
  end

  private
  def search_params
    params.permit(:search, diet: [])
  end
end
