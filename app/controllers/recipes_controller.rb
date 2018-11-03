class RecipesController < ApplicationController

   def home
   end

   def show
     @recipe = ApiMuncherWrapper.recipe_detail(params[:uri])

   end

   def index
     @recipes = ApiMuncherWrapper.list_recipes(params[:title])
   end


end
