require 'httparty'

class RecipeApiWrapper
  BASE_URL = "https://api.edamam.com"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(food_search)
    recipes_url = "#{BASE_URL}/search?q=#{food_search}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    data = HTTParty.get(recipes_url)

    recipe_list = Array.new

    if data["hits"]
      data["hits"].each do | recipe |
        recipe_list << create_recipe(recipe)
      end
    end

    return recipe_list
  end

  def self.show_recipe_detail(uri)
    recipe_uri = "#{BASE_URL}/search?r=#{uri}&app_id=#{APP_ID}&app_key=#{APP_KEY}"

    encoded_recipe_uri = URI.encode(recipe_uri)

    recipe = HTTParty.get(encoded_recipe_uri)
    recipe_detail = create_recipe_detail(recipe)
    return recipe_detail
  end

  private

  def self.create_recipe(recipe_api_params)
    return Recipe.new(
      recipe_api_params["recipe"]["label"],
      {
        image: recipe_api_params["recipe"]["image"],
        uri: recipe_api_params["recipe"]["uri"]
      }
    )
  end

  def self.create_recipe_detail(recipe_api_params)
    if recipe_api_params[0] == nil
      return nil
    else
      recipe = Recipe.new(
        recipe_api_params[0]["label"],
        {
          image: recipe_api_params[0]["image"],
          source: recipe_api_params[0]["source"],
          url: recipe_api_params[0]["url"],
          ingredients: recipe_api_params[0]["ingredientLines"],
          yield: recipe_api_params[0]["yield"],
          diet: recipe_api_params[0]["dietLabels"]
        }
      )
    end
  end
end
