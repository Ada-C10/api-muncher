require 'kaminari/config'
require 'kaminari/helpers/paginator'
require 'kaminari/models/page_scope_methods'
require 'kaminari/models/configuration_methods'



class RecipesController < ApplicationController

   def home
     render  layout:  "home_o"
   end

   def show
     @recipe = ApiMuncherWrapper.recipe_detail(params[:uri])

   end

   def index
     page = params[:page] || 1
     recipe_list = ApiMuncherWrapper.list_recipes(params[:title])
     @recipes = Kaminari.paginate_array(recipe_list).page(page).per(10)

     if @recipes == [] || @recipes == nil
        flash.now[:result_text] = "No result found, modify the search keyword and try again. "
     end
   end

   def catch_404
     raise ActionController::RoutingError.new(params[:path])
   end

end
