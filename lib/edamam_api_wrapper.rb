require 'httparty'

class EdamamApiWrapper
  RECIPE_URI = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_"
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.search_recipes(query)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{query}"
    #if doesn't work - change & to be included in string before it

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    recipe_list = []

    if response["hits"]["recipe"]
      response["hits"]["recipe"].each do |hit|
        recipe_list << create_recipe(hit)
      end
    else
      return []
    end
    return recipe_list
  end


  def self.show_recipe(id)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&r=" + RECIPE_URI + "#{id}"

    response = HTTParty.get(url)
    if response.success?
      recipe = EdamamApiWrapper.create_recipe(response)
      binding.pry
      return recipe
    end
  end

  private

  def self.id_from_uri(uri)
    return uri.split("_")[1]
  end

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params[0]["label"],
      api_params[0]["image"],
      api_params[0]["uri"],
      api_params[0]["url"],
      {
        id: self.id_from_uri(api_params[0]["uri"]),
        ingredientLines: api_params[0]["ingredientLines"],
        ehalthLabels: api_params[0]["healthLabels"]
      }
    )
  end


end
