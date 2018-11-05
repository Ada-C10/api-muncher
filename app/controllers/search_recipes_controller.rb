class SearchRecipesController < ApplicationController

  def new
  end

  def index
    if params[:search] && params[:search] != ""
      recipes = EdamamApiWrapper.find_recipes_for(params[:search])

      if recipes.first
        @recipes = recipes.paginate(:page => params[:page], per_page: 10)
      else
        flash[:status] = :failure
        flash[:result_text] = "Sorry, no recipes were found for your request"
        redirect_to(root_path)
      end

    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Search input cannot be blank"
      render :new, status: :bad_request
    end

  end

  def show
    recipe = EdamamApiWrapper.find_recipe(params[:id])

    if recipe.first
      @recipe = recipe.first
    else
      flash[:status] = :failure
      flash[:result_text] = "No recipe found"
      redirect_to(search_recipes_path)
    end
  end

end
