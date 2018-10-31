class RecipesController < ApplicationController
require 'will_paginate/array'

  def index
    recipes = EdamamApiWrapper.recipe_search(params[:keyword])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
  end

end
