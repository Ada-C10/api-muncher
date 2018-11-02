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


    @recipes = EdamamApiWrapper.list_recipes(params["search_terms"])
    binding.pry
    if @recipes.empty?
      flash[:danger] = "There are no results for this search."
      redirect_to root_path
    end
    page = params[:page] || 1
    @test = Kaminari.paginate_array(@recipes).page(page)
    # @paginatable_array = Kaminari.paginate_array(@recipes, total_count: 100).page(params[:page]).per(10)
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
