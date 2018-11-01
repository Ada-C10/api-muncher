class RecipesController < ApplicationController

  def index
    @recipes = ApiMuncherWrapper.list_recipes
  end

  # def new
  #   @channel = params[:channel]
  # end

end
