require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(search_terms)
    if search_terms == nil
      return []
    end

    url = BASE_URL + "search?q=" + search_terms + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&to=50"
    encoded_uri = URI.encode(url)
    data = HTTParty.get(encoded_uri)

    recipe_list = []

    data["hits"].each do |recipe_data|
      recipe_list << create_recipe(recipe_data)
    end

    return recipe_list
  end

  def self.find_recipe(id)
    url = BASE_URL + "search?r=" + "http://www.edamam.com/ontologies/edamam.owl#" + id + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    encoded_uri = URI.encode(url)
    data = HTTParty.get(encoded_uri)

    if data.nil?
      return nil
    else
      return data[0]
    end
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(api_params["recipe"]["uri"], api_params["recipe"]["label"], api_params["recipe"]["image"], api_params["recipe"]["source"])
  end
end
