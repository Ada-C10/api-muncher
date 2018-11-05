
class RecipesController < ApplicationController
  def index

    @search = params[:search]

    if @search.nil?

      flash[:status] = :failure
      flash[:result_text] = "We're sorry you did not enter any ingredients to look up recipes. Please try again!"
      redirect_to root_path
      return
    end
    if @search.empty?

      flash[:status] = :failure
      flash[:result_text] = "We're sorry you did not enter any ingredients to look up recipes. Please try again!"
      redirect_to root_path
    else
      @edamam_recipes = EdamamApiWrapper.list_recipes(@search)
      @recipes = Kaminari.paginate_array(@edamam_recipes).page(params[:page]).per(12)
      if @recipes.empty?
        flash.now[:status] = :failure
        flash.now[:result_text] = "We're sorry we couldn't find any recipes for '#{@search}'"
        render :index, status: :bad_request
      end
    end
  end


  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
    if @recipe == []
      flash[:status] = :failure
      flash[:result_text] = "We're sorry we couldn't find a recipe details for id: #{params[:id]}"
      redirect_to root_path, status: :bad_request
    end
  end

end
