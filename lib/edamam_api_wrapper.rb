require 'httparty'
require 'pry'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.send_msg(search)
    puts "Retrieving EDAMAM Recipes for the search term #{search}"

    url = BASE_URL + "?q=#{search}" + "&app_id=#{ID}&app_key=#{KEY}" + "&from=0&to=19"
    response = HTTParty.get(url)
    # HTTParty.get("https://api.edamam.com/search?q=chocolate&app_id=5d462879&app_key=21e92c993e17ec0b8fd8a81096405aa9&from=0&to=19"
    return response
  end


  def self.create_recipe(recipe_params)
    return Recipe.new(
      name: recipe_params["recipe"]["label"],
      id: recipe_params["recipe"]["uri"].match(/recipe_(.+)/).captures,
      url: recipe_params["recipe"]["url"],
      image: recipe_params["recipe"]["image"],
      ingredients: recipe_params["recipe"]["ingredients"].map {|item| item["text"]},
      calories: recipe_params["recipe"]["calories"].round(0),
      health_labels: recipe_params["recipe"]["healthLabels"]
    )
  end




#response["hits"][0]["recipe"]
end
