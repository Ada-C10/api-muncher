class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :search_history, only: [:create, :destroy, :clear]

  def index
    recipe_uris = @login_user.favorites.pluck(:recipe_uri_fragment)
    @recipes = recipe_uris.map {|uri|
      EdamamApiWrapper.get_recipe(uri)
    }
    if @recipes.any? {|recipe| recipe == nil}
      flash.now[:error] = "Deet deet deet, waiting for the API to respond! You're probably making too many requests/minute."
      render "/layouts/api_error", status: :failure
    end
  end

  def create
    favorite = Favorite.new(user_id: session[:user_id],
                            recipe_uri_fragment: params[:recipe_uri_fragment])
# add flash message for invalid uniqueness scope user
    if favorite.save
      flash[:status] = :success
      redirect_to favorites_path
    else
      flash[:status] = :failure
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    favorite = @login_user.favorites.find_by(id: params[:id])
    favorite.destroy
    redirect_back fallback_location: root_path
  end

  def clear
    @login_user.favorites.destroy_all
    redirect_to favorites_path
  end
end
