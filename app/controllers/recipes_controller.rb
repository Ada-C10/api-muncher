
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

  def show
    @recipe = ApiMuncherWrapper.show_details(uri_from_id(params[:id]))

  end

private

def uri_from_id(id)
  return CGI.escape("http://www.edamam.com/ontologies/edamam.owl#recipe_#{id}")
end


end
