class PagesController < ApplicationController
  def home
    @recent_searches = Search.limit(10).reverse_order
    @bg_image = UnsplashWrapper.image("food", true)
  end

  def search
    if params[:queery]
      session[:queery] = params[:queery]
      Search.create(queery: params[:queery])
    end

    @bg_image = UnsplashWrapper.image(session[:queery], true)

    if params[:page]
      session[:page] = params[:page].to_i
    else
      session[:page] = 1
    end

    @recipes = EdamamWrapper.search(session[:queery], session[:page])
  end

  def recipe
    if params[:uri]
      recipe = EdamamWrapper.recipe(params[:uri])
    else
      recipe = EdamamWrapper.recipe(params[:title])
    end
    session[:uri] = recipe.uri
    @recipe = recipe
  end
end
