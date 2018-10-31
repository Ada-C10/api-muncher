class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #prevents CSRF, must have authenticating token
end
