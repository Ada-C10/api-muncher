require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["EDAMAM_ID"]

  def self.search(word)
    # formatted_word = word.split.join("+")
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{TOKEN}" + "&q=#{word}"
    formatted_url = URI.encode(url)
    data = HTTParty.get(formatted_url)

    all_recipes = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        all_recipes << create_recipe(recipe_data)
      end
      return all_recipes
    else
      return []
    end
  end

  def self.list_recipes
    #code
  end

  private

  def self.create_recipe(api_params)
    # binding.pry
    return Recipe.new(
      api_params["recipe"]["uri"],
      api_params["recipe"]["label"],
      api_params["recipe"]["image"],
      api_params["recipe"]["url"],
      api_params["recipe"]["ingredientLines"],
      api_params["recipe"]["totalNutrients"]
    )
  end
end
