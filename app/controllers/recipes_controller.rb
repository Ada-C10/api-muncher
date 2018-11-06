class RecipesController < ApplicationController
  before_action :find_query

  def index
    @recipes = EdamamApiWrapper.search_recipes(params[:query])

    if @recipes.count == 0
      flash.now[:errror] = "Sorry, there are no recipes for that ingredient."
    end

  end

  def show
    @recipe = EdamamApiWrapper.recipe_contents(params[:id])

    if @recipe.nil?
      render :show, status: :not_found
    end
  end

  private

  def find_query
    @query = params[:query]
  end

end
