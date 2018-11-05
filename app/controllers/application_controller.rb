class ApplicationController < ActionController::Base
  require 'will_paginate/array'

  before_action :find_user
  before_action :require_login

  private

  def find_user
    if session[:user_id]
      @login_user = User.find_by(id: session[:user_id])
    end
  end

  def require_login
    unless session[:user_id]
      redirect_to root_path
    end
  end

end
