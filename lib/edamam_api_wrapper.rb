require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(term)
    url = BASE_URL + "?q=#{term}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=0" + "&to=30"

    data = HTTParty.get(url)

    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
      return recipe_list
    else
      return []
    end
  end

  def self.recipe_details(uri)
    encoded_uri = URI.encode(uri)
    url = BASE_URL + "?&app_id=#{ID}" + "&app_key=#{KEY}" + "&r=#{encoded_uri}"

    data = HTTParty.get(url)

    return recipe_data(data)
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["image"],
      api_params["recipe"]["uri"]
    )
  end

  def self.recipe_data(api_params)
    details_hash = {}
    details_hash[:label] = api_params[0]["label"]
    details_hash[:original_url] = api_params[0]["url"]
    details_hash[:ingredients] = api_params[0]["ingredientLines"]
    details_hash[:diet_labels] = api_params[0]["dietLabels"]
    details_hash[:health_labels] = api_params[0]["healthLabels"]
    return details_hash
  end
end
