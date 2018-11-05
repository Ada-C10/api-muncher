class RecipesController < ApplicationController

  def index
    unless params.key?('from')
      params[:from] = 0
    end

    response = EdamamApiWrapper.search_recipes(params)
    response = EdamamApiWrapper.parse_api_response(response)

    @recipes = response[:recipes]
    @more_results = response[:more_results]
    @next_from = response[:next_from]
    @prev_from = response[:prev_from]
    @query = params[:query]
  end

  def show
    @recipe = EdamamApiWrapper.get_recipe(params[:recipe])
  end


end
