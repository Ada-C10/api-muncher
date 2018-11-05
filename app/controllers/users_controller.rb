class UsersController < ApplicationController
  BASE = "http://www.edamam.com/ontologies/edamam.owl#"

  def favorite
    @current_user.add_to_favorites((BASE + params[:uri]))
    redirect_back fallback_location: '/'
  end

  def remove
    @current_user.remove((BASE + params[:uri]))
    redirect_back fallback_location: '/'
  end

  def favs
    @favs = []
    @current_user.favorites.each do |uri|
      @favs << EdamamWrapper.recipe((BASE + uri))
    end
    @bg_image = UnsplashWrapper.image("kitchen", true)
  end
end
