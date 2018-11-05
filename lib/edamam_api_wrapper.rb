require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  APP_KEY = ENV["EDAMAM_KEY"]
  APP_ID = ENV["EDAMAM_ID"]

  def self.list_recipes(query)
    url = BASE_URL + query + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end

    return recipe_list
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      {name: api_params["recipe"]["label"],
        image: api_params["recipe"]["image"],
        source: api_params["recipe"]["source"],
        url: api_params["recipe"]["url"],
        yield: api_params["recipe"]["yield"],
        ingredients: api_params["recipe"]["ingredientLines"],
        labels: api_params["recipe"]["healthLabels"],
        cautions: api_params["recipe"]["cautions"]
      }
    )
  end

end
