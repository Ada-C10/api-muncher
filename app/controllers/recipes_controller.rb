class RecipesController < ApplicationController
require 'will_paginate/array'

  def index
    recipes = EdamamApiWrapper.list_recipes(params[:query])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe =  EdamamApiWrapper.find_recipe(params[:id])
    if @recipe.nil?
      redirect_to recipes_path
    end
  end

  def new
    # @recipe = params[:hits]
  end


end
