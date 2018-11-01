class RecipesController < ApplicationController
require 'will_paginate/array'

  def home
  end

  def index
    @keyword = params[:keyword]

    recipes = EdamamApiWrapper.recipe_search(params[:keyword])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    if !recipes.any?
      render :index, status: :bad_request
    end
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:id])
    if @recipe.nil?
      render :show, status: :bad_request
    end
  end

end
