require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(keyword)
    url = BASE_URL + "q=#{keyword}" + "&app_id=#{ ID }" + "&app_key=#{ KEY }"
    encoded_uri = URI.encode(url)
    data = HTTParty.get(encoded_uri)
    recipe_list = []
    data["hits"].each do |recipe|
      recipe_list << create_recipe(recipe)
    end
    return recipe_list
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      api_params["image"],
      {
        url: api_params["url"],
        ingredients: api_params["ingredients"],
        dietary_information: api_params["healthLabels"]
      }
    )
  end
end
