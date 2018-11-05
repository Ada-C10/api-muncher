require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(keyword)
    url = BASE_URL + "search?" + "q=#{keyword}" + "&app_id=#{ ID }" + "&app_key=#{ KEY }" + "&from=0&to=100"
    encoded_uri = URI.encode(url)
    data = HTTParty.get(encoded_uri)
    recipe_list = []
    data["hits"].each do |recipe|
      label = recipe["recipe"]["label"]
      image = recipe["recipe"]["image"]
      uri = recipe["recipe"]["uri"]
      recipe_list << create_recipe(recipe)
    end
    return recipe_list
  end

  def self.show_recipe(id)
    url = BASE_URL + "search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"
    data = HTTParty.get(url)
    if data.empty?
      return []
    else
      return create_recipe(data[0])
    end
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      {
        image: api_params["image"],
        url: api_params["url"],
        ingredients: api_params["ingredients"],
        dietary_information: api_params["healthLabels"]
      }
    )
  end
end
