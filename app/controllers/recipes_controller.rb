require 'will_paginate/array'
class RecipesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.search_recipes(params[:search])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    @search_param = params[:search]
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

end
