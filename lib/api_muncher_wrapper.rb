require 'httparty'

class ApiMuncherWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.list_recipes(search_input)
    url = BASE_URL + "?" +"q=#{search_input}"+ "&app_id=#{APP_ID}&app_key=#{APP_KEY}"
    data = HTTParty.get(url).parsed_response
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  private

  def self.create_recipe(recipe_data)
    return Recipe.new(
      recipe_data["recipe"]["label"],recipe_data["recipe"]["url"],recipe_data["recipe"]["ingredients"],recipe_data["recipe"]["totalNutrients"]

    )
  end

end

# a = HTTParty.get("https://api.edamam.com/search?q=chicken&app_id=0d591779&app_key=90beed83e3ea9fb311a8e2085c7b8112&from=0&to=3&calories=591-722&health=alcohol-free")
# puts a.body
#
# response = HTTParty.get("https://api.edamam.com/search?q=chicken dumpline&app_id=0d591779&app_key=90beed83e3ea9fb311a8e2085c7b8112")
# parsed_response = response.parsed_response
