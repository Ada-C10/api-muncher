require 'will_paginate/array'

class RecipesController < ApplicationController

def new

end

def index
  @recipies = EdamamApiWrapper.list_recipes(params[:word]).paginate(page: params[:page], per_page: 10)
  # binding.pry
end




def show

@recipe = EdamamApiWrapper.show_recipe(params[:word])

end



end
