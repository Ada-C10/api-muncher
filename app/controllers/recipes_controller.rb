class RecipesController < ApplicationController
  before_action :find_searched_dish

  def new
  end

  def index
    # @dish = params[:dish]
    @recipes = EdamamApiWrapper.find_recipes('q',@dish)


    if @recipes
      render :index
      #list recipes
    else
      redirect_to root_path
    end
  end

  def show
    # @recipe = EdamamApiWrapper.find_recipes('r', params[:uri])
    # #use params[:uri] to find recipe in wrapper
    # @recipe = #
  end

  private

  def find_searched_dish
    @dish = params[:dish]
  end

end
