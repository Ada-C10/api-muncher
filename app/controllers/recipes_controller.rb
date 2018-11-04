require 'will_paginate/array'
class RecipesController < ApplicationController

  def index
    recipes = EdamamApiWrapper.search_recipes(params[:search])
    if recipes.empty?
      flash[:error] = "No grub found. Please refine your search."
      redirect_back fallback_location: root_path
    else
      @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
      @search_param = params[:search]
    end

  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
  end

end
