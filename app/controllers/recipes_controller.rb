
require 'will_paginate/array'

class RecipesController < ApplicationController

  def homepage

  end

  def index
    page = params[:page] || 1
    @recipes = ApiMuncherWrapper.list_recipes(params[:recipe],page).paginate(:page => page, :per_page => 10)
  end

  def create

  end
  # def new
  #   @channel = params[:channel]
  # end

end
