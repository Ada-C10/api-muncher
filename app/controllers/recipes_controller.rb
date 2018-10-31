class RecipesController < ApplicationController
  def index
    @search = params[:search]
    @recipes = EdamamApiWrapper.list_recipes(@search)
  end

  def new

  end

  def create
  end

  def show
  end

  def search
  end
end
