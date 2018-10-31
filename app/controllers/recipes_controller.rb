class RecipesController < ApplicationController
  def find
    food_to_search = params[:food_type]
    binding.pry
  end
end
