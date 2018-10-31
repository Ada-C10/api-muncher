class RecipesController < ApplicationController


  def index
    if params[:user_search]
      @query = params[:user_search]
      @response = EdamamApiWrapper.send_msg(@query)

      @recipes = []
      @response["hits"].each do |recipe|
         @recipes << EdamamApiWrapper.create_recipe(recipe)
      end
      binding.pry

      if @recipes
        flash.now[:success] = "Search results found:"
        render :index
      else
        flash.now[:warning] = "No recipes found, try again."
        render :index
      end
    end
  end

  def show


  end


end
