class RecipesController < ApplicationController
  def find
    if params[:find]
      @find = params[:find]
      @recipe = EdamamApiWrapper.find_recipe(@find)
    else
      @recipe = nil
      flash[:warning] = 'invalid request'
      redirect_to root_path
    end

  end

  def list
    if params[:search]
      @search = params[:search]
      @recipes = EdamamApiWrapper.list_recipes(@search)
    else
      @recipes = []
    end
  end

end
