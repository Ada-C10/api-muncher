require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN_ID = ENV["APPLICATION_ID"]
  TOKEN_KEY = ENV["APPLICATION_KEYS"]

  def self.list_recipes(search)
    # create url with search
    url = BASE_URL + "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&q=#{search}"
    recipes = HTTParty.get(url)

    recipe_list = []
    if recipes["hits"]
      recipes["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    
    return recipe_list
  end

  def self.find_recipe(find)
    url = BASE_URL + "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&r=#{find}"
    recipe = HTTParty.get(url)

    if recipe["hits"]
      create_recipe(recipe)
    else
      recipe = nil
    end

    return recipe
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
        api_params["recipe"]["uri"],
        api_params["recipe"]["label"],
        api_params["recipe"]["image"],
        api_params["recipe"]["source"],
        api_params["recipe"]["url"]
    )
  end

end
