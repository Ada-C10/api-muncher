class SearchController < ApplicationController

  def index
    @hits = params[:hits]
  end

  def new
    @hits = params[:hit]
  end

  def create
    EdamamApiWrapper.search_recipes(params[:q])

    redirect_to root_path
  end

end
