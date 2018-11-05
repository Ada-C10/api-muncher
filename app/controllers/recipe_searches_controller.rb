require "cgi"

class RecipeSearchesController < ApplicationController
  skip_before_action :require_login

  def home
  end

  def index
    if params[:q] && session[:user_id]
      query = Query.create(user_id: session[:user_id],
                           q: CGI.escape(params[:q].downcase),
                           search_term: params[:q].downcase)
    end

    params[:q] ||= ""
    @query = params[:q].downcase

    filters = {}
    if params[:health]
      filters[:health] = params[:health]
    end

    recipes = EdamamApiWrapper.list_recipes(@query, filters: filters)
    if recipes.nil?
      flash.now[:error] = "Deet deet deet, waiting for the API to respond! You're probably making too many requests/minute."
      return render "/layouts/index_api_error", status: :failure
    end
    @shuffle = params["shuffle"]
    if @shuffle == "t"
      length = recipes.length
      recipes = recipes.sample(length)
    end

    @recipes = recipes.paginate(:page => params[:page], :per_page => 6)

    @health_labels = EdamamApiWrapper.list_tags(@recipes, :health_labels)
#TODO: put this back before production
    # begin
    #   @recipes = EdamamApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 6)
    # rescue
    #   @recipes = []
    # end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:id])
    if @recipe
    flash[:status] = :success
    else
      flash[:status] = :failure
      flash[:message] = "It's not the number one most urgent thing in the world, but there was an issue with your request and we couldn't find that recipe."
      render 'layouts/not_found', status: :not_found
    end
  end
end
