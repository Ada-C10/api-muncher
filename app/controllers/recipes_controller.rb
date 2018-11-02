class RecipesController < ApplicationController

  def home

  end


  def index
    if params[:user_search]
      query = params[:user_search]
      @recipes = EdamamApiWrapper.send_search(query)

      if @recipes == []
        flash.now[:warning] = "No recipes found for this search, try again."
        render :index
      else
        @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
        flash.now[:success] = "Search results found:"
        render :index
      end
    end
  end

  def show
    id = params[:recipe]
    response = EdamamApiWrapper.retrieve_recipe(id)
    if response.empty?
      render :notfound, status: :not_found
    else
      @recipe = EdamamApiWrapper.create_recipe(response[0])
    end
  end


end
