require 'httparty'
require 'awesome_print'

class EdamamApiWrapper
   #example url search: "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free"

  BASE_URL = "https://api.edamam.com/search" #what query params are attached to (?q for eng, ?r for nums)
  REQUEST_URI = URI::encode("http://www.edamam.com/ontologies/edamam.owl#recipe_")
  ID = ENV["EDAMAM_ID"]
  TOKEN = ENV["EDAMAM_TOKEN"]

  def self.search_recipes(search_query)
    url = BASE_URL + "?q=" + "#{search_query}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    if data["hits"].count == 0
      return false
    else
      return data
    end
  end

  def self.get_one_recipe(recipe_id)

    url = BASE_URL + "?r=" + "#{REQUEST_URI}" + "#{recipe_id}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)

    if data.count == 1
      return data
    end

    return false
  end

end #class end
