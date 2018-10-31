class SessionsController < ApplicationController

  def create #looks to omniauth for params
    @auth_hash = request.env['omniauth.auth']
  end

  
end
