class RecipesController < ApplicationController
  def index
    @search = search_params[:search]
    # Consider if search is ""(controller), cannot be found (wrapper)
    @recipes = EdamamApiWrapper.list_recipes(@search).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.recipe_details(params[:id])
    if @recipe.id != params[:id]
      flash[:status] = :warning
      flash[:message] = "This recipe does not exist."
      redirect_to root_path
    end
  end

  private
  def search_params
    params.permit(:search)
  end
end
