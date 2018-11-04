class RecipeController < ApplicationController

  def search
    @recipes = EdamamApiWrapper.list_recipes(:keyword)
  end

  def index
    @keyword = params[:keyword]
    @recipes = EdamamApiWrapper.search_recipes(@keyword).paginate(page: params[:page], per_page: 10)
  end


end
# @search = params[:label]
#    @recipes = EdamamApiWrapper.list_recipes(params[:label])
#    @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
