class RecipesController < ApplicationController
  class RecipeController < ApplicationController
  before_action :ingredients, except: [:main, :show]

  def self.paginate(term, current_page)
    if term
      where('name LIKE ?', "%#{term}").paginate(page: page, per_page: 5).order('id DESC')
    else
      paginate(page: page, per_page: 5).order('id DESC')
    end
  end

  def index
    @recipes = EdamamApiWrapper.list_recipes(@ingredients)
    if @recipes.nil?
      flash[:status] = :warning
      flash[:result_text] = "No recipes with #{@ingredients}. Please try a different ingredient or word."
      redirect_to root_path
    else
      @recipes_paginated = will_paginate.paginate_array(@recipes).page(params[:page]).per(10)
    end
  end

  def show
    @recipe = EdamamApiWrapper.find_recipe(params[:id])
    if @recipe.nil?
      flash[:status] = :danger
      flash[:result_text] = "Recipe not found. Please try again."
      redirect_to root_path
    end
  end

  def new
    @search = params[:search_term]
  end

  private
  def ingredients
    @ingredients = params[:ingredients]

    if @ingredients.nil?
      flash[:status] = :danger
      flash[:result_text] = "Could not find recipes. Invalid seach params."
      redirect_to root_path
    end
  end
end

end
