class RecipesController < ApplicationController


  def index
    if params[:user_search]
      @query = params[:user_search]
      @response = EdamamApiWrapper.send_search(@query)

      @recipes = []
      @response["hits"].each do |recipe|
         @recipes << EdamamApiWrapper.create_recipe(recipe["recipe"])
      end

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
    id = params[:recipe]
    response = EdamamApiWrapper.retrieve_recipe(id)
    @recipe = EdamamApiWrapper.create_recipe(response[0])
  end


end
