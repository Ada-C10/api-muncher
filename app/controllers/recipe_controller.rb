class RecipeController < ApplicationController

  # def search
  #   @recipes = EdamamApiWrapper.list_recipes(:keyword)
  # end

  # def index
  #   @keyword = params[:keyword]
  #   @recipes = EdamamApiWrapper.list_recipes(@keyword).paginate(page: params[:page], per_page: 10)
  # end
  #
  #   def index
  #       @keyword = params[:keyword]
  #        recipes = EdamamApiWrapper.list_recipes(params[:keyword])
  #       @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
  #       if !recipes.any?
  #         render :index, status: :bad_request
  #       end
  #     end
  #
  #
  # end
  # @search = params[:label]
  #    @recipes = EdamamApiWrapper.list_recipes(params[:label])
  #    @recipes = Kaminari.paginate_array(@recipes).page(params[:page]).per(10)
  def index
    @keyword = params[:keyword]
    recipes = EdamamApiWrapper.list_recipes(params[:keyword])
    @recipes = recipes.paginate(:page => params[:page], :per_page => 10)
    if !recipes.any?
      render :index, status: :bad_request
    end
  end
end
