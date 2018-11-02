class SearchController < ApplicationController

  def index
      @recipes = EdamamApiWrapper.search_recipes(params[:q])
  end

  def new
  end

  def create
    redirect_to search_index_path(params[:q])
  end

  # def show
  #   recipe_id = params[:id]
  #   @recipe= Recipe.find_by(id: recipe_id)
  #   if @recipe.nil?
  #     head :not_found
  #   end
  # end



end
