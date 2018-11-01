
class RecipesController < ApplicationController
  
  def index
    search_term = params[:search_term] #the params come from the index form
    if !search_term.nil?
      recipes_array = EdamamApiWrapper.list_recipes(search_term)
      # @recipes =  recipes_array.page(10)
      # @recipes = Kaminari.paginate_array(recipes_array).page(1).per(10)
      @recipes = Kaminari.paginate_array(recipes_array).page(params[:page]).per(10)

    end
    # binding.pry
    #need to add some conditions around this
  end

  def show
    # binding.pry
    @recipe = EdamamApiWrapper.find_recipe_by(params[:uri])
  end

end
