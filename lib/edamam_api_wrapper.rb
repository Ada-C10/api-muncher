require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.find_recipes_for(query)
    url = BASE_URL + "#{query}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=0" + "&to=50"

    encoded_uri = URI.encode(url)

    data = HTTParty.get(encoded_uri)
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
    return Recipe.new(api_params["recipe"]["label"],
      {
        image: api_params["recipe"]["image"],
        source: api_params["recipe"]["source"],
        url: api_params["recipe"]["url"],
        ingredients: api_params["recipe"]["ingredientLines"], # array
        calories: api_params["calories"],
        diet_labels: api_params["recipe"]["dietLabels"], #array
        health_labels: api_params["recipe"]["healthLabels"]
      }
    )

  end



end
