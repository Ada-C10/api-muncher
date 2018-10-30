require 'httparty'

class EdamamApiWrapper

  BASE_URL = 'https://api.edamam.com/search'
  TOKEN = ENV['EDAMAM_TOKEN']
  ID = ENV['EDAMAM_ID']

  def self.list_recipes
    url = BASE_URL + "?q=" + q + "&app_id=" + ID + "&app_key=" TOKEN

  end

  def self.list_recipe(recipe_uri)
    # Get rid of odd characters
    encoded_uri = URI.encode(recipe_uri)
    # Send the request
    HTTParty.get(encoded_uri).parsed_response

  end

  # http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_7bf4a371c6884d809682a72808da7dc2
  # Swap out end with the number of the recipe somehow
end
