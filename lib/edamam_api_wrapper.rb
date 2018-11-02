require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]



  def self.search_recipes(q)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{q}"

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    recipe_list = []

    if response["hits"]
      response["hits"].each do |hit|
        recipe_list << create_recipe(hit)

      end
    end
    return recipe_list
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["url"],
      {
        image: api_params["recipe"]["image"],
        ingredientLines: api_params["recipe"]["ingredientLines"]
      }
    )
  end

end
