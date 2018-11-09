require 'will_paginate/array'

class RecipesController < ApplicationController

  def homepage
    
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(params[:search]).paginate(page: params[:page], per_page: 10)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe_detail(params[:id])
    # binding.pry
  end

end
