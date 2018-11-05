class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    favorite = Favorite.new(user_id: @login_user.id,
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
  end
end
