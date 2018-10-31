class RecipesController < ApplicationController

  def search
    @query = params[:user_search]
  end

  def display
    @query = params[:user_search]
    response = EdamamApiWrapper.send_msg(@query)
    if response
      binding.pry
      flash[:success] = "Search successful"
    else
      flash.now[:warning] = "Search failed, try again."
      render :search
    end
  end


end
