class RecipesController < ApplicationController
  def show
    if params[:find]
      @find = params[:find]
      @recipe = EdamamApiWrapper.find_recipe(@find)
    else
      @recipe = nil
      flash[:warning] = 'invalid request'
      redirect_to root_path
    end

  end

  def index
    if params[:search]
      @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(page: params[:page], per_page: 10)
    else
      @recipes = []
    end
  end

end
