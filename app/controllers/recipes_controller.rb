class RecipesController < ApplicationController
  def index
    # require 'pry';binding.pry

    @search_term = params[:recipes]
    @recipes = EdamamApiWrapper.search(@search_term).paginate(:page => params[:page], :per_page => 10)
    # return
    # binding.pry
  end

  # def new
  # end
  #
  # def create
  #   redirect_to recipes_path(params[:keyword])
  # end

  def search
    @search = params[:recipes]
    params.permit!(:recipes)
    if @search
      redirect_to recipes_index_path(params[:recipes])
      return
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:recipe])
    if @recipe.diet_labels == []
      @recipe.diet_labels << "N/A"
    end
  end
end
