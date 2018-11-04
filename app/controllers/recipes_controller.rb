require 'will_paginate/array'

class RecipesController < ApplicationController

  before_action :valid_search?, only: [:index]

  def search
  end

  def index
    if @valid_search
      flavor = params[:search]
      recipes = RecipeSearchApiWrapper.get_recipes(flavor)
      if recipes
        session[:search] = flavor
        @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
      else
        session[:search] = nil
        flash[:status] = :failure
        flash[:result_text] = "No recipes found for #{flavor}"
        redirect_to root_path
      end
    else
      session[:search] = nil
      flash[:status] = :failure
      flash[:result_text] = "Please enter a flavor to search"
      redirect_to root_path
    end
  end

  def show
    recipe_id = params[:link]
    @recipe = RecipeSearchApiWrapper.get_recipe(recipe_id)
    if !@recipe
      flash[:status] = :failure
      flash[:result_text] = "Recipe not found"
      redirect_to root_path
    end
  end

  private

  def valid_search?
    @valid_search = params[:search] && params[:search] != ""
  end

end
