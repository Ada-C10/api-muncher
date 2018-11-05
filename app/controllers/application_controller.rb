class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'will_paginate/array'

  before_action :find_user
  before_action :require_login
  before_action :search_history

  private

  def find_user
    if session[:user_id]
      @login_user = User.find_by(id: session[:user_id])
    end
  end

  def require_login
    unless session[:user_id]
      render "/layouts/login"
    end
  end

  def search_history
    if session[:user_id]
      @search_history = @login_user.queries.order(created_at: :desc).limit(10)
    end
  end

end
