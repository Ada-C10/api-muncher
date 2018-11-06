require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?" #prevents u from re-writing the url
  APP_ID = ENV["EDAMAM_APPLICATION_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEYS"]

  def self.search(food)
    url = BASE_URL  + "q=#{food}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}&@from=0&to=50"
    data = HTTParty.get(url) #use httparty to send of the url
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
      return recipe_list #returns list of recipes from api
    else
      ArgumentError
    end
  end

  def self.find_a_recipe(food)
    encoded = "http://www.edamam.com/ontologies/edamam.owl#" + food
    url_parsed = URI.encode(encoded)
    url = BASE_URL  + "r=#{url_parsed}&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url) #use httparty to send of the url
    if data
      recipe_list = []
      data.parsed_response.each do |recipe_data|
        recipe_list << keyboard(recipe_data)
      end
      return recipe_list
    else
      ArgumentError
    end
  end

  private

  def self.create_recipe(api_params) #<--holds all the logic
    return Recipe.new(
      api_params["recipe"]["uri"],
      label: api_params["recipe"]["label"],
      image: api_params["recipe"]["image"],
      serving: api_params["recipe"]["yield"],
      dietLabels: api_params["recipe"]["dietLabels"],
      healthLabels: api_params["recipe"]["healthLabels"],
      ingredients: api_params["recipe"]["ingredients"],
      calories: api_params["recipe"]["calories"]
    )
  end

  def self.keyboard(api_params)
    return Recipe.new(
      api_params["uri"], #already in recipe
      label: api_params["label"],
      image: api_params["image"],
      serving: api_params["yield"],
      dietLabels: api_params["dietLabels"],
      healthLabels: api_params["healthLabels"],
      ingredients: api_params["ingredients"],
      calories: api_params["calories"]
   )
  end
end
