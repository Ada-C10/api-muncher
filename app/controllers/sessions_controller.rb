class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]

  def create
    auth_hash = request.env['omniauth.auth']
    user = User.find_by(uid: auth_hash[:uid], provider: auth_hash[:provider])
    if user
      # User was found in the database
      flash[:status] = :success
      flash[:result_text] = "Successfully logged in as existing user #{user.name}"
    else
      # User doesn't match anything in the DB
      # Attempt to create a new user
      user = User.build_from_omniauth(auth_hash)
         if user.save
           flash[:status] = :success
           flash[:result_text] = "Successfully created new user #{user.name} with ID #{user.id}"
         else
           flash.now[:status] = :failure
           flash.now[:result_text] = "Could not create new user account"
           flash.now[:messages] = user.errors.messages
           return redirect_to root_path
         end
    end

    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    # also destroy queries
    session[:user_id] = nil
    flash[:status] = :success
    flash[:result_text] = "Successfully logged out"
    redirect_to root_path
  end
end
