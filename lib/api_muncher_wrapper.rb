require 'httparty'


class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(search_input)
    url = BASE_URL + "?" +"app_id=#{APP_ID}&app_key=#{APP_KEY}"+"&q=#{search_input}"+ "&to=100"
    # encoded_url = URI.encode(url)
    data = HTTParty.get(url).parsed_response

    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  def self.recipe_detail(recipe_uri)
    url = "https://api.edamam.com/search" + "?" + "app_id=#{APP_ID}&app_key=#{APP_KEY}"+"&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{recipe_uri}"
    data = HTTParty.get(url).parsed_response

    if data[0]
        result = Recipe.new(data[0]["label"], data[0]["uri"],data[0]["ingredientLines"],data[0]["dietLabels"],data[0]["image"], data[0]["url"] )

    end
    return result
  end

  private

  def self.create_recipe(recipe_data)

    return Recipe.new(
      recipe_data["recipe"]["label"],recipe_data["recipe"]["uri"],recipe_data["recipe"]["ingredientLines"],recipe_data["recipe"]["dietLabels"], recipe_data["recipe"]["image"],recipe_data["recipe"]["url"]

    )
  end
end
