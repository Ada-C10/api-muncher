class SessionsController < ApplicationController

  def root; end

  def create #looks to omniauth for params
    auth_hash = request.env['omniauth.auth']

    user = User.find_by(uid: auth_hash[:uid], provider: 'github')
    if user
      # user exists
      flash[:success] = "Logged in as returning user #{user.name}"

    else
      # new account!
      user = User.build_from_github(auth_hash)

      if user.save
        flash[:success] = "Logged in as new user #{user.name}"
      else
        #error -- cannot create account
        flash[:error] = "Could not create new user account: #{user.errors.messages}"
        redirect_to root_path
        return
      end
    end
    #user exists!
    session[:user_id] = user.id
    redirect_to root_path
  end


  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully logged out!"

    redirect_to root_path
  end
end
