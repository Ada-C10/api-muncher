class RecepiesController < ApplicationController
  def index
    @recepies = EdamamApiWrapper.list_recipes(params[:message])
  end
end
