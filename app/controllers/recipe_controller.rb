class RecipeController < ApplicationController
  
  def search
    search = params[:user_search]
    if EdamamApiWrapper.send_msg(search)
      flash[:success] = "Search successful"
    else
      flash.now[:warning] = "Search failed, try again."
      render :search
    end
  end


end
