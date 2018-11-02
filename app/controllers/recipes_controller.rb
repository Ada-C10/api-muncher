require 'pry'

class RecipesController < ApplicationController
  def index
    @search = params[:search]
    if @search.empty?
      flash[:status] = :failure
      flash[:result_text] = "We're sorry you did not enter any ingredients to look up recipes. Please try again!"
      redirect_to root_path
    else
      @edamam_recipes = EdamamApiWrapper.list_recipes(@search)
      @recipes = Kaminari.paginate_array(@edamam_recipes).page(params[:page]).per(12)

    end
  end


  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

  def search
  end

  def new
  end
end
