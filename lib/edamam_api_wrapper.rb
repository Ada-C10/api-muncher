require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  ID = ENV["RECIPE_ID"]
  TOKEN = ENV["RECIPE_TOKEN"]


  def self.search_recipe(query)
    url = BASE_URL + "#{query}" + "&app_id=#{ID}&app+key=#{TOKEN}"

    return HTTParty.get(url)

  end
end
