require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["RECIPE_ID"]
  TOKEN = ENV["RECIPE_TOKEN"]


  def self.search_recipe(query)
    url = BASE_URL + "#{query}" + "&app_id=#{ID}&app_key=#{TOKEN}"

    responses = HTTParty.get(url)["hits"]

    recipes = responses.map do |response|
      create_recipe(response["recipe"])
    end

    return recipes

  end

  private

  def self.create_recipe(api_params)

    ingredients = api_params["ingredients"].map do |ing_hash|
      ing_hash["text"]
    end

    return Recipe.new(
      api_params["label"],
      api_params["image"],
      ingredients,
      {
        dietary_information: api_params["dietLabels"]
      }
    )
  end
end
