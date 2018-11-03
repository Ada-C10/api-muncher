class RecipeSearchController < ApplicationController
  def search
  end

  def index
    params[:q] ||= ""
    @query = params[:q].downcase
    filters = {}
    
    if params[:health]
      filters[:health] = params[:health]
    end

    @recipes = EdamamApiWrapper.list_recipes(@query, filters: filters).paginate(:page => params[:page], :per_page => 6)
    @health_labels = EdamamApiWrapper.list_tags(@recipes, :health_labels)
#TODO: put this back before production
    # begin
    #   @recipes = EdamamApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 6)
    # rescue
    #   @recipes = []
    # end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:uri])
    if @recipe
    flash[:status] = :success
    else
      flash[:status] = :failure
      flash[:message] = "It's not the number one most urgent thing in the world, but there was an issue with your request and we couldn't find that recipe."
      render 'layouts/not_found', status: :not_found
    end
  end
end
