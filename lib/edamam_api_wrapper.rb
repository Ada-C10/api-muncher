require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]

  def self.list_recipes(word)
    url = BASE_URL + "q=#{word}" + "&app_id=#{ ID }" + "&app_key=#{ KEY }"
    data = HTTParty.get(url)
    recipe_list = []
    return recipe_list
  end

  def self.search_recipe(id)

  end
  #
  private

  # def self.create_recipe(api_params)
  #   api_params[:label]
  #   {
  #     image: api_params["image"]
  #     dietary_info: api_params["health_labels"]
  #     ingredients: api_params["ingredients"]["text"]
  #   }
  # end
end
