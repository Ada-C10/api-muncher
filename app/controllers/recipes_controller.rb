class RecipesController < ApplicationController
  def index
    @search = params[:label]
    @recipes = EdamamApiWrapper.list_recipes(params[:label])
    @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)

  end

  def show
    @recipe = EdamamApiWrapper.single_recipe(params[:id])
    if @recipe == []
      render "layouts/notfound", status: :not_found
    end
  end

  def search
  end





end
