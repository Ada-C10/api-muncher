require 'will_paginate/array'

class RecipesController < ApplicationController

def new

end

def index
  @recipes = EdamamApiWrapper.list_recipes(params[:word]).paginate(page: params[:page], per_page: 10)

  if @recipes.empty?
    flash[:message] = "Couldn't find food items with that search. Please try again"
  end
end




def show

@recipe = EdamamApiWrapper.show_recipe(params[:word])

end



end
