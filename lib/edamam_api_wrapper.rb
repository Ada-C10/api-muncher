require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV[APP_ID]
  KEY = ENV[APP_KEY]

  def self.search_recipes(query)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{query}"
    #if doesn't work - change & to be included in string before it

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    recipe_list = []

    if response["hits"]
      response["hits"].each do |hit|
        recipe_list << create_recipe(hit)

      end
    end
    return search_list
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      {
        label: api_params["recipe"]["label"],
        image: api_params["recipe"]["label"],
        url: api_params["recipe"]["url"],
        ingredientLines: api_params["recipe"]["ingredientLines"],
        healthLabels: api_params["recipe"]["healthLabels"]
      }
    )
  end


end
