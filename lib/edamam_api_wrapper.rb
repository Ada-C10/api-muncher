require 'httparty'

class EdamamApiWrapper
  TOKEN_ID = ENV["APPLICATION_ID"]
  TOKEN_KEY = ENV["APPLICATION_KEYS"]
  BASE_URL = "https://api.edamam.com/search"
  QUERY_URL = "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&q="
  FIND_URL = "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&r="


  def self.list_recipes(search)
    # create url with search
    url = BASE_URL + "#{QUERY_URL}" + "#{search}"
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
    url = BASE_URL + "#{FIND_URL}" + "#{find}"
    encoded_url = URI.encode(url)
    recipe = HTTParty.get(encoded_url)
    if recipe[0]
      found = show_recipe(recipe[0])
    else
      found = nil
    end

    return found
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
        api_params["recipe"]["uri"],
        api_params["recipe"]["label"],
        api_params["recipe"]["image"],
        api_params["recipe"]["source"],
        api_params["recipe"]["url"],
        api_params["ingredientLines"],
        api_params["healthLabels"],
        api_params["cautions"]
    )
  end


  def self.show_recipe(api_params)
    return Recipe.new(
        api_params["uri"],
        api_params["label"],
        api_params["image"],
        api_params["source"],
        api_params["url"],
        api_params["ingredientLines"],
        api_params["healthLabels"],
        api_params["cautions"]
        )
  end
end
