
class RecipesController < ApplicationController

  def index
    search_term = params[:search_term] #the params come from the index form
    if !search_term.empty?
      recipes_array = EdamamApiWrapper.list_recipes(search_term)
      if !recipes_array.empty?
        # @recipes =  recipes_array.page(10)
        # @recipes = Kaminari.paginate_array(recipes_array).page(1).per(10)
        @recipes = Kaminari.paginate_array(recipes_array).page(params[:page]).per(10)
      else
        flash.now[:result_text] = "Recipes matching the search '#{search_term}' were not found, please try again!"
      end
    else
      flash.now[:result_text] = "Oops! a blank search. Please try again"
      render :index

      # redirect_back fallback_location: root_path, status: :bad_request
    end
    # binding.pry
    #need to add some conditions around this
  end

  def show
    # binding.pry
    @recipe = EdamamApiWrapper.find_recipe_by(params[:uri])
    if @recipe.nil?
      flash.now[:result_text] = "We're sorry this recipe's show page couldn't be found, please try another recipe!"
      render :index
      # redirect_back fallback_location: root_path, status: :bad_request
    end
  end

  def home
  end

end
