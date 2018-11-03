require 'pry'
class RecipesController < ApplicationController

  def home
  end


  def index
    if params[:user_search]
      query = params[:user_search]
      labels = params[:health_labels].select { |label| label != "0" }
      @recipes = EdamamApiWrapper.send_search(query, labels)
      if @recipes == nil
        @error = "Looks like we couldn't return recipe results for that search. Try again?"
        render :index
      else
        @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
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
