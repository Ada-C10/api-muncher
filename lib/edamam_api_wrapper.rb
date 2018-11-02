require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  APP_ID = bd3c75d8

  def self.list_recipes(word)
    url = BASE_URL + "q=#{word}" + "&app_id=#{ APP_ID }" + "&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)
    recipe_list = []
    hits.each do |hit|
      name = ["recipe"]["label"]
      image = ["recipe"]["image"]
    end
    return name
  end

  private

  def self.create_recipe(api_params)
    api_params[:label]
    {
      image: api_params["image"]
      dietary_info: api_params["health_labels"]
      ingredients: api_params["ingredients"]["text"]
    }
end
