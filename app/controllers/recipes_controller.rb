class RecipesController < ApplicationController
  def index
    @keyword = params[:keyword]
    recipes = EdamamApiWrapper.list_recipes(params[:keyword])
    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(10)
    # binding.pry
    if !recipes.any?
      render :index, status: :bad_request
    end
  end
end
