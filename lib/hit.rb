require 'httparty'

class Hit
  include HTTParty
  format :json

  base_uri ' https://api.edamam.com'
end
