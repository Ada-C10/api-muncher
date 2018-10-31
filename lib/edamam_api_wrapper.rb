require 'httparty'
require 'pry'
require 'uri'

class EdamamApiWrapper
  BASE_URI = "https://api.edamam.com"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.list_recipes(query, from: 0, to: 9)
    uri = BASE_URI + "/search?q=#{query}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&from=#{from}" + "&to=#{to}"
    data = HTTParty.get(uri)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |hit_data|
        recipe_list << build_recipe(hit_data)
      end
    end
    return recipe_list
  end

  private

# Concentrate all the logic that relies on the specific Edamam API data
# in a single method here. (If the data in the API response changes,
# this will be the only method we need to update.)
  def self.build_recipe(api_params)
    args = Hash.new

    args[:label] = api_params["recipe"]["label"]
    args[:recipe_uri] = URI(api_params["recipe"]["uri"])
    # http://www.edamam.com/ontologies/edamam.owl#recipe_3d81878cd040aa6a73a2c3f11293102a
    args[:image_uri] = api_params["recipe"]["image"]
    args[:source] = api_params["recipe"]["source"]
    args[:source_uri] = api_params["recipe"]["url"]
    args[:recipe_yield] = api_params["recipe"]["yield"]
    args[:health_labels] = api_params["recipe"]["healthLabels"]
    args[:ingredient_lines] = api_params["recipe"]["ingredientLines"]
    args[:total_time] = api_params["recipe"]["totalTime"]

    return Recipe.new(args)
  end

end

# Sample Request:
# https://api.edamam.com/search?q=lemongrass&app_id=beffb2cc&app_key=a902dd278d98d1d773adffc24a34dd1f&from=0&to=3

# Verify it works through the rails console:
# EdamamApiWrapper.list_recipes("lemongrass")
