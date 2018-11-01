class RecepesController < ApplicationController
  def index
    @recepes = EdamamApiWrapper.list_recipes(params[:message])
  end
end
