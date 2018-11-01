require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["app_key"]
  ID = ENV["app_id"]

  def self.list_recipes(word)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{word}"
    url = URI.encode(url)

    data = HTTPart.get(url)

    recipe_list = []

    if data["hits"]
      data["hits"].each do |hit|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end



end
