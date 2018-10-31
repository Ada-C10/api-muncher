class RecipesController < ApplicationController

  # def search
  #   @query = params[:user_search]
  # end

  def index
    @query = params[:user_search]
    @response = EdamamApiWrapper.send_msg(@query)
    binding.pry
    if @response
      flash.now[:success] = "Search results found:"
      render :index
    else
      flash.now[:warning] = "Search failed, try again."
      render :search
    end
  end



end
