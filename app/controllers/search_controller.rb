class SearchController < ApplicationController

  def create
    if EdamamApiWrapper.search_recipes(@query)
      redirect_to recipes_index_path
    else
      flash.now[:warning] = "Didn't work"
    end
  end

  def new; end

  private

  def user_query
    @query = params[:query]
  end

end #end of class
