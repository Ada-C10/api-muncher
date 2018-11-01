require 'httparty'
require 'pry'

class RecipeApiWrapper
  BASE_URL = "https://api.edamam.com"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(food_search)
    recipes_url = "#{BASE_URL}/search?q=#{food_search}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    data = HTTParty.get(recipes_url)

    recipe_list = []

    if data["hits"]
      data["hits"].each do | recipe |
        recipe_list << create_recipe(recipe)
      end
    end

    return recipe_list
  end

  private

  def self.create_recipe(recipe_api_params)
    return Recipe.new(
      recipe_api_params["recipe"]["label"],
      {
        image: recipe_api_params["recipe"]["image"],
        source: recipe_api_params["recipe"]["source"],
        url: recipe_api_params["recipe"]["url"],
        ingredients: recipe_api_params["recipe"]["ingredientLines"],
        yield: recipe_api_params["recipe"]["yield"],
        diet: recipe_api_params["recipe"]["dietLabels"],
      }
    )
  end
end
