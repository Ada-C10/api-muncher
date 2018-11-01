require 'httparty'

# https://api.edamam.com/search?q=chicken&app_id=05485fbf&app_key=7c36d5a80f584cf96980d40f9dbdafa4
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  # Rails Console Test: EdamamApiWrapper.find_recipe("chicken")
  def self.find_recipe(search_term)
    base_url = "#{BASE_URL}" + "q=#{search_term}" + "&" + "app_id=#{APP_ID}" + "&" + "app_key=#{APP_KEY}"
    encoded_url = URI.encode(base_url)
    response = HTTParty.get(encoded_url)

    recipe_list = []
    if response
      index = 0
      while index < response["hits"].length do
        single_recipe = response["hits"][index]["recipe"]
        recipe_list << create_recipe(single_recipe)
        index += 1
      end
      return recipe_list

    else
      return nil
    end

  end

  # x["hits"][0]["recipe"]["label"]
  def self.create_recipe(recipe)
    input_hash = {}
    input_hash[:label] = recipe["label"]
    input_hash[:image] = recipe["image"]
    input_hash[:url] = recipe["url"]
    input_hash[:dietLabels] = recipe["dietLabels"]
    input_hash[:healthLabels] = recipe["healthLabels"]
    input_hash[:ingredientLines] = recipe["ingredientLines"]
    return Recipe.new(input_hash)
  end
end
