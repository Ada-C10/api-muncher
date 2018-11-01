require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    if params[:recipe]
      @recipes = (EdamamApiWrapper.list_recipes(params[:recipe])).paginate(:page => params[:page], :per_page => 12)
    end
    # binding.pry
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :image, :uri, :ingredients, :dietary_info)
  end
end
