require 'httparty'

# https://api.edamam.com/search?q=chicken&app_id=05485fbf&app_key=7c36d5a80f584cf96980d40f9dbdafa4
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  # Rails Console Test: EdamamApiWrapper.find_recipe("chicken")
  def self.find_recipe(search_term)
    base_url = "#{BASE_URL}" + "q=#{search_term}" + "&" + "app_id=#{APP_ID}" + "&" + "app_key=#{APP_KEY}"
    encoded_url = URI.encode(base_url)
    response = HTTParty.get(encoded_url)

    # if successful
    return response
    # if not successful
    # do this instead
  end
end
