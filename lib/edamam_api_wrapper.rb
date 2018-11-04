require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(keyword)
    url = BASE_URL + "q=#{keyword}" + "&app_id=#{ ID }" + "&app_key=#{ KEY }" + "&from=0&to=100"
    encoded_uri = URI.encode(url)
    data = HTTParty.get(encoded_uri)
    recipe_list = []
    data["hits"].each do |recipe|
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      uri = recipe["recipe"]["uri"]
      recipe_list << create_recipe(recipe)
    end
    return recipe_list
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["uri"],
      api_params["recipe"]["image"],
      {
        url: api_params["recipe"]["url"],
        ingredients: api_params["recipe"]["ingredients"],
        dietary_information: api_params["recipe"]["healthLabels"]
      }
    )
  end
end
