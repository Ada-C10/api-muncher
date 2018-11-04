require 'will_paginate/array'
class RecipesController < ApplicationController

  def root
  end

  def index
    recipes = EdamamApiWrapper.search(params[:search])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

end
