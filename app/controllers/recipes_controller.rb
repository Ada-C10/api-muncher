class RecipesController < ApplicationController

  def home
    render layout: "home_layout"
  end

  def index
    @search_terms = params[:q]
    recipes = EdamamApiWrapper.list_recipes(params[:q])

      if recipes.empty?
        flash[:warning] = "No results found"
      end

    @recipes = Kaminari.paginate_array(recipes).page(params[:page]).per(10)
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])

    if @recipe.nil?
      flash.now[:danger] = "Recipe does not exist"
      render :notfound, status: :not_found
    end
  end
end
