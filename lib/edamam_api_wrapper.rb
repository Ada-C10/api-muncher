require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.find_recipes_for(query)
    url = BASE_URL + "search?q=#{query}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=0" + "&to=50"

    encoded_uri = URI.encode(url)

    data = HTTParty.get(encoded_uri)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end

    return recipe_list
  end

  def self.find_recipe(parsed_id)

    url = BASE_URL + "search?r=" + "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23" + "#{parsed_id}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

    data = HTTParty.get(url)

    if data.first 
      return details_recipe(data.first)
    else
      return []
    end

  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      URI(api_params["recipe"]["uri"]),
      {
        image: api_params["recipe"]["image"],
        source: api_params["recipe"]["source"],
        url: api_params["recipe"]["url"],
        ingredients: api_params["recipe"]["ingredientLines"], # array
        calories: api_params["recipe"]["calories"],
        diet_labels: api_params["recipe"]["dietLabels"], #array
        health_labels: api_params["recipe"]["healthLabels"]
      }
    )
  end

  def self.details_recipe(data)
    return Recipe.new(
      data["label"],
      URI(data["uri"]),
      {
        image: data["image"],
        source: data["source"],
        url: data["url"],
        ingredients: data["ingredientLines"],
        calories: data["calories"],
        diet_labels: data["dietLabels"],
        health_labels: data["healthLabels"]
      }
    )
  end

end
