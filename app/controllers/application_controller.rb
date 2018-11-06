class ApplicationController < ActionController::Base

  rescue_from ActionController::RoutingError do |exception|
    flash[:result_text] = "The page you were looking for doesn't exist"
    redirect_to root_path
  end

end
