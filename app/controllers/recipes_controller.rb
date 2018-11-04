class RecipesController < ApplicationController
  rescue_from ArgumentError, with: :record_not_found

  def home
  end

  def index

    if params[:food].nil? || params[:food].empty?
      flash[:warning] = "Please enter a food in search bar for recipes."
      redirect_to root_path
    else
      @food = params[:food]
      @recipes = EdamamApiWrapper.search_recipes(@food)

        if @recipes.empty?
          flash[:warning] = "Sorry no recipes found for #{@food}, try a different recipe."
          redirect_to root_path
        end
      end

  end

  def show

    if params[:uri].nil? || params[:uri].empty?
      flash[:warning] = "Sorry recipe does not exist."
      redirect_to root_path
    end

    uri = params[:uri]
    @recipe = EdamamApiWrapper.find_recipe(uri)

    if @recipe.nil?
      render :notfound, status: :not_found
    end
  end

  private
   def record_not_found
     render :notfound, status: :not_found
   end

end
