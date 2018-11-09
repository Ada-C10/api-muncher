class RecipesController < ApplicationController
  before_action :find_query

  def index
    @recipes = EdamamApiWrapper.search_recipes(find_query).paginate(page: params[:page], per_page: 10)

    if @recipes == false
      render :notfound, status: :not_found
    end

  end

  def show
    @recipe = EdamamApiWrapper.recipe_contents(params[:uri])

    if @recipe.nil? || @recipe == false
      redirect_to root_path, status: :not_found
    end
  end

  private

end
