class RecipesController < ApplicationController

def new

end

def index
  @recipies = EdamamApiWrapper.list_recipes(params[:word])
  # binding.pry
end


def show



end



end
