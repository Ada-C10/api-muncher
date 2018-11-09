require 'will_paginate/array'

class SearchController < ApplicationController

  def new
  end

  def create
    # list_recipes = q(params[:keyword])
    redirect_to search_index_path(params[:keyword])
  end

  def index
    recipes = EdamamApiWrapper.search(params[:keyword])
     @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @recipe = EdamamApiWrapper.show_recipe(params[:recipe])
  end


end
