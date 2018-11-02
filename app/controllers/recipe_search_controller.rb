class RecipeSearchController < ApplicationController
  def search
  end

  def index
    @query = params[:q].downcase
    begin
      @recipes = EdamamApiWrapper.list_recipes(@query).paginate(:page => params[:page], :per_page => 6)
    rescue
      @recipes = []
    end
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:uri])
    if @recipe
    flash[:status] = :success
    else
      flash[:status] = :failure
      flash[:message] = "It's not the most urgent thing in the world, but there was an issue with your request and we couldn't find that recipe."
      render 'layouts/not_found', status: :not_found
    end
  end
end
