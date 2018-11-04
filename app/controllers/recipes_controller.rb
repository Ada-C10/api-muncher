require_dependency '../../lib/EdamamApiWrapper.rb'
require_dependency '../../lib/recipe.rb'
require 'kaminari'

class RecipesController < ApplicationController

  def index
    @search_term = params[:search]
      if @search_term
        @recipes = EdamamApiWrapper.search_recipes(params[:search])
      else
        @recipes = nil
      end

    if @recipes.nil?
      flash[:status] = :warning
      flash[:result_text] = "No recipes with that ingredient. Please try a different ingredient or word."
      # redirect_to root_path
    else
      @recipes
      # @recipes_paginated = kaminari.paginate_array(@recipes).page(params[:page]).per(10)
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:search_term])
    if @recipe.nil?
      flash[:status] = :warning
      flash[:result_text] = "Recipe not found. Please try again."
      redirect_to root_path
    end
  end

  def new
    @search = params[:search_term]
  end

  private
  def ingredients
    @ingredients = params[:ingredients]

    if @ingredients.nil?
      flash[:status] = :warning
      flash[:result_text] = "Could not find recipes. Invalid seach params."
      redirect_to root_path
    end
  end
end
