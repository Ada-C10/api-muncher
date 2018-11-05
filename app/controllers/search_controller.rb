class SearchController < ApplicationController
after_action :user_query, only: :new


  def create
    #when search happens
  end

  def new; end

  private

  def user_query
    @query = params[:query]
  end

end #end of class
