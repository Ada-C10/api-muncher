class RecipesController < ApplicationController
  def index
    @recipes = EdamamApiWrapper.list_recipes(search_params)
    @query = search_params
  end

  def show
  end

  private

    def search_params
      return params.require(:query)
    end
end
