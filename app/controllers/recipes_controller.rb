
require 'will_paginate/array'

class RecipesController < ApplicationController


  def index
    @recipes = ApiMuncherWrapper.list_recipes.paginate(:page => params[:page], :per_page => 4)
  end

  # def new
  #   @channel = params[:channel]
  # end

end
