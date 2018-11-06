class RecipesController < ApplicationController
  require 'will_paginate/array'



  def index
    @recipe_query = params[:q] || ""
    # @recipe_query = (params[:q] || "", params[:page])
    @recipes = MuncherApiWrapper.get_recipes(@recipe_query).paginate(:page => params[:page], :per_page => 10)

    #@recipes.all  .page params[:page]

  end

  def show
    recipe_id = params[:r]
    @recipe = MuncherApiWrapper.get_recipe(recipe_id)
    # if @recipe.nil?

  end
end
