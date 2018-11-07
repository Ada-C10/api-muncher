require 'httparty'

class MuncherApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["EDAMAM_ID"]
  APP_KEY = ENV["EDAMAM_KEY"]

  def self.get_recipes(query)
    recipes = []
    url = "#{BASE_URL}?app_id=#{APP_ID}&app_key=#{APP_KEY}&q=#{query}" + "&to=100"
    data = HTTParty.get(url)
    if data["hits"]
      data["hits"].each do |hit|
        name = hit["recipe"]["label"]
        uri = hit["recipe"]["uri"]
        image = hit["recipe"]["image"]
        recipe = Recipe.new(name, uri, image)
        recipes << recipe
      end
    end

    return recipes
  end

  def self.get_recipe(recipe_id)
    url = "#{BASE_URL}?app_id=#{APP_ID}&app_key=#{APP_KEY}&r=#{ERB::Util.url_encode(recipe_id)}"
    data = HTTParty.get(url)
    recipe = nil

    if data && data.length > 0
      name = data[0]["label"]
      uri = data[0]["uri"]
      image = data[0]["image"]
      ingredientLines = data [0]["ingredientLines"]
      healthLabels = data [0]["healthLabels"]
      recipe = Recipe.new(name, uri, image, ingredientLines, healthLabels )
    end

    return recipe
  end

end
