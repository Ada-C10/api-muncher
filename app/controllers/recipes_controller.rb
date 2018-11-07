class RecipesController < ApplicationController
require 'will_paginate/array'

  def home
  end

  def index

    @keyword = params[:keyword]
    @health_labels = params_health_labels

    recipes = EdamamApiWrapper.recipe_search(@keyword, @health_labels)
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

private
  def params_health_labels
    health_labels = []
    @HEALTH_LABELS.each do |label|
      if params[label] == "1"
        health_labels << label
      end
    end
    return health_labels
  end

end
