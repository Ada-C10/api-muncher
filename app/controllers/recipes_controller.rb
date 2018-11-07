require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    if params[:recipe] == ""
      redirect_to root_path
      flash[:warning] = "There are no results for this search. Try again."
    else
      @recipes = (EdamamApiWrapper.list_recipes(params[:recipe])).paginate(:page => params[:page], :per_page => 12)
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])

    if !@recipe
      render 'layouts/not_found', status: :not_found
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :uri, :ingredients, :dietary_info)
  end
end
