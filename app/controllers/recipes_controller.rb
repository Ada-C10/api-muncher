class RecipesController < ApplicationController

  def index
    @search_term = params[:search_term]
    recipes = EdamamApiWrapper.list_recipes(@search_term)

    if recipes.length > 0

      @recipes = recipes.paginate(page: params[:page], per_page: 10)
    else
      flash[:status] = :failure
      flash[:result_text] = "No results match #{@search_term}"
      redirect_to root_path
    end
  end

  def search_splash
  end

  def searcher
    # if params[:search_term]
    redirect_to recipes_path(search_term: params[:search_term])
    # else
    # flash[:status] = :failure
    # flash[:result_text] = "No results match #{@search_term}}"
    # end
  end

  def show
    uri_num = params[:uri_num]
    @recipe = EdamamApiWrapper.show_single_recipe(uri_num)

    if @recipe.nil?
      flash[:status] = :failure
      flash[:result_text] = "Cannot locate #{params[:uri_num]}"
      redirect_to root_path
    end
  end

end
