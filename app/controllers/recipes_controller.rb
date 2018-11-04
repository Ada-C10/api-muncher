require 'will_paginate/collection'
class RecipesController < ApplicationController

# # require 'kaminari/config'
# require 'kaminari/helpers/paginator'
# require 'kaminari/models/page_scope_methods'
# require 'kaminari/models/configuration_methods'

  def index
    # @values = WillPaginate::Collection.create(current_page, per_page, values.length) do |pager|
    #   pager.replace values
    # end

    # arr = (1..100).to_a
    # page, per_page = 1, 10
    # arr[((page - 1) * per_page)...(page * per_page)] #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    # page, per_page = 2, 10
    # arr[((page - 1) * per_page)...(page * per_page)]

    # TODO Only loading ten for some reason. Research.
    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
    # binding.pry
    if @recipes.empty?
      flash[:danger] = "There are no results for this search."
      redirect_to root_path
    else
      page = params[:page] || 1
      @recipes = Kaminari.paginate_array(@recipes).page(page).per(10)
    end
  end 

  def show
    @recipe = EdamamApiWrapper.list_recipe(params["id"])[0]
    if @recipe
      @name = @recipe["label"]
      @ingredients = @recipe["ingredients"]
      @dietLabels = @recipe["dietLabels"]
      @photo = @recipe["image"]
      @creator = @recipe["source"]
      @url = @recipe["url"]
    else
      flash[:danger] = "This recipe does not exist in our database"
      redirect_to root_path
    end
  end

end
