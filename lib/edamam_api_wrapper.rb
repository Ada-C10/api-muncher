require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]

  def self.list_recipes(search_term)
    url = BASE_URL + "search?q=#{search_term}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    if data["hits"]
      data["hits"].map do |hit|
        uri = hit["recipe"]["uri"]
        image_url = hit["recipe"]["image"]
        recipe_url = hit["recipe"]["url"]
        label = hit["recipe"]["label"]
        dietaryinformation = hit["recipe"]["healthLabels"]
        ingredients = hit["recipe"]["ingredientLines"]

        Recipe.new(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
      end
    else
      return []
    end
  end
end
