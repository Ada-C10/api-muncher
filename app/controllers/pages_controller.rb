class PagesController < ApplicationController
  def home
    @recent_searches = Search.limit(10).reverse_order
  end

  def search
    if params[:queery]
      session[:queery] = params[:queery]
      Search.create(queery: params[:queery])
    end

    if params[:page]
      session[:page] = params[:page].to_i
    else
      session[:page] = 1
    end
    puts session[:queery]

    @recipes = EdamamWrapper.search(session[:queery], session[:page])
  end

  def recipe
    if params[:title]
      if params[:url]
        session[:recipe] = params
      else
        session[:recipe] = EdamamWrapper.recipe(params[:title])
      end
    end
    @recipe = session[:recipe]
  end
end
