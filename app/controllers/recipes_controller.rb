class RecipesController < ApplicationController

  before_action :find_dish, only: [:index, :show]

  def new
    @homepage = true
  end

  def index
    # @dish = params[:dish]

    @recipes = EdamamApiWrapper.find_recipes('q', @dish)

    if @recipes == nil
      flash[:error] = "Something went wrong."
      redirect_to root_path
    elsif @recipes.empty?
      flash.now[:error] = "No recipes found for #{@dish}. Try another search."
    else
      render :index
      #list recipes
    end
  end

  def show
    # @dish = params[:dish]

    find_uri
    # @uri = params[:uri]

    if @uri == nil || @uri == ""
      flash[:error] = "Something went wrong. Can't locate link to this #{@dish}."
      redirect_to root_path
    else
      @recipe = EdamamApiWrapper.find_recipes('r', @uri)
    end
  end

  private

  def find_dish
    @dish = params[:dish]
  end

  def find_uri
    @uri = params[:uri]
  end

end
