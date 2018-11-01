require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_APP_ID = ENV['EDAMAM_APP_ID']
  EDAMAM_APP_KEY = ENV['EDAMAM_APP_KEY']

  def self.find_recipes(dish_name)
    url = BASE_URL + '?q=' + dish_name + '&app_id=' + EDAMAM_APP_ID + '&app_key=' + EDAMAM_APP_KEY
    response = HTTParty.get(url)

    if response["hits"]
      recipe_list = response["hits"].map do |hit|
        create_recipe(hit)
      end
    else
      return []
    end
    return recipe_list
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new( api_params["recipe"]["label"],
    {
      ingredients: api_params["recipe"]["ingredientLines"],
        uri: api_params["recipe"]["uri"],
        image_url: api_params["recipe"]["image"],
        dietary_info: api_params["recipe"]["dietLabels"],
        health_info: api_params["recipe"]["healthLabels"]
      }
    )
  end
end
