require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @query = params[:query]
    @recipes = EdamamApiWrapper.list_recipes(@query).paginate(page: params[:page], per_page: 10)

    if @recipes.empty?
      flash.now[:message] = "Could not find any recipes for '#{@query}'. Here are some yummy ones instead!"
      @query = "yummy"
      @recipes = EdamamApiWrapper.list_recipes(@query).paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @recipe = EdamamApiWrapper.display_recipe(params[:id])

    if @recipe.nil?
      flash.now[:message] = "Recipe not found. Try another search!"
    end
  end
end
