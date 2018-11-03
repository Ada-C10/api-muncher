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
        uri = format_uri(hit["recipe"]["uri"])
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

  def self.format_uri(uri)
    uri = uri.split("#")
    base_uri = "http://www.edamam.com/ontologies/edamam.owl#"
    r = base_uri + uri.last
    return CGI.escape(r)
  end

  def self.find_recipe(uri)
    new_uri = CGI.escape("http://www.edamam.com/ontologies/edamam.owl#recipe_#{uri}")
    url = BASE_URL + "search?r=#{new_uri}" + "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    #binding.pry
    if data
      data.map do |array|
        uri = format_uri(array["uri"])
        image_url = array["image"]
        recipe_url = array["url"]
        label = array["label"]
        dietaryinformation = array["healthLabels"]
        ingredients = array["ingredientLines"]

        Recipe.new(label, uri, image_url, recipe_url, dietaryinformation, ingredients)
      end
    else
      return []
    end
  end
end
