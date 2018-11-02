class SearchController < ApplicationController

  def index
      @recipes = EdamamApiWrapper.search_recipes(params[:q])
  end

  def new
  end

  def create
    redirect_to search_index_path(params[:q])
  end

end
