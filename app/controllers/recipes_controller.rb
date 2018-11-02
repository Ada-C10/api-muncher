class RecipesController < ApplicationController
  before_action :find_searched_dish, only: [:new, :index]

  def new
    # @dish = params[:dish]
    if @dish
      redirect_to list_recipes_path(@dish)
    else
      render :new
    end
  end

  def index
    # @dish = params[:dish]
    @recipes = EdamamApiWrapper.find_recipes(@dish)

    if @recipes
      render :index
      #list recipes
    else
      redirect_to root_path
    end
  end

  def show
  end

  private

  def find_searched_dish
    @dish = params[:dish]
  end

end
