class RecipesController < ApplicationController

  def new
    @recipe = params[:recipe]
  end

end
