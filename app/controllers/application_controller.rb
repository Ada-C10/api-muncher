class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session #better for APIs/ adds verify_authenticity_token before all requests, null session subs in an empty session, doesn't change current one
end
