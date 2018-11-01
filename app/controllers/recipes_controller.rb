class RecipesController < ApplicationController

   def home
   end

   def show
     # @receipt = Recipe.find_by()
   end

   def index
     @recipes = ApiMuncherWrapper.list_recipes(params[:name])
   end


end
