require 'will_paginate/array'

class RecipesController < ApplicationController


  def search
  end

  def results

    @query = params[:query]

    @recipes = EdamamApiWrapper.search_recipes(@query).paginate(page: params[:page], per_page: 10)
  end

  def show
    uri = params[:uri]
    @recipe = EdamamApiWrapper.find_recipe(uri)

  end
end
