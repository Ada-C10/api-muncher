class RecipesController < ApplicationController
  before_action :find_query

  def index
    @recipes = EdamamApiWrapper.search_recipes(@query)

    if @recipes == false
      flash.now[:errror] = "Sorry, there are no recipes for that ingredient."
    end

  end

  def show
    @recipe = EdamamApiWrapper.recipe_contents(params[:uri])

    if @recipe.nil? || @recipe == false
      redirect_to root_path, status: :not_found
    end
  end

  private

  def find_query
    @query = params.permit[:query]
  end

end
