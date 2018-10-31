require 'will_paginate/array'

class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(search_params).paginate(page: params[:page], per_page: 10)
    @query = search_params
  end

  def show
    @recipe = EdamamApiWrapper.display_recipe(params[:id])
  end

  private

    def search_params
      return params.require(:query)
    end
end
