require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?" #prevents u from re-writing the url
  APP_ID = ENV["EDAMAM_APPLICATION_ID"]
  APP_KEY = ENV["EDAMAM_APPLICATION_KEYS"]

  def self.search(food)
    url = BASE_URL  + "q=#{food}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url) #use httparty to send of the url
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  private

  def self.create_recipe(api_params) #<--holds all the logic
    return Recipe.new(
      uri: api_params["uri"],
      api_params["label"],
      api_params["image"],
      api_params["yield"],
      api_params["label"],
      api_params["dietLabels"],
      api_params["healthLabels"],
      api_params["ingredients"],
    )
    end
  end
