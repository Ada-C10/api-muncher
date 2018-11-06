require 'httparty'
require 'awesome_print'
require 'pry'

class EdamamApiWrapper
   #example url search: "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free"

  BASE_URL = "https://api.edamam.com/search" #what query params are attached to (?q for eng, ?r for nums)
  REQUEST_URI = URI::encode("http://www.edamam.com/ontologies/edamam.owl#recipe_")
  ID = ENV["EDAMAM_ID"]
  TOKEN = ENV["EDAMAM_TOKEN"]

  def self.search_recipes(search_query)
    url = BASE_URL + "?q=" + "#{search_query}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    recipes_list = []

    if data["hits"].count == 0 || data.code == 403
      return false
    else
      data["hits"].each do |recipe_info|
        recipes_list << arrange_recipe(recipe_info)
      end
    end
    # binding.pry
    return recipes_list

  end

  def self.recipe_contents(recipe_id)

    url = BASE_URL + "?r=" + "#{REQUEST_URI}" + "#{recipe_id}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"

    data = HTTParty.get(url)

    if data.count <= 0
      return false
    end

    recipe = single_recipe(data[0])

    return recipe
  end

  private

  def self.single_recipe(api_params) #extract data from a single recipe detail search
    recipe_id = api_params["uri"]
    recipe_id.slice! "http://www.edamam.com/ontologies/edamam.owl#recipe_"

    return Recipes.new(
    api_params["label"],
    recipe_id,
    api_params["image"],
    api_params["ingredientLines"],
    api_params["yield"],
    api_params["source"],
    api_params["dietLabels"],
    api_params["healthLabels"],
    api_params["calories"],
    api_params["totalTime"],
    api_params["url"]
  )


  end

  def self.arrange_recipe(api_params) #extract data from an array of recipe hashes
    recipe_id = api_params["recipe"]["uri"]
    recipe_id.slice! "http://www.edamam.com/ontologies/edamam.owl#recipe_"

    return Recipes.new(
    api_params["recipe"]["label"],
    recipe_id,
    api_params["recipe"]["image"],
    api_params["recipe"]["ingredientLines"],
    api_params["recipe"]["yield"],
    api_params["recipe"]["source"],
    api_params["recipe"]["dietLabels"],
    api_params["recipe"]["healthLabels"],
    api_params["recipe"]["calories"],
    api_params["recipe"]["totalTime"],
    api_params["recipe"]["url"],
  )

  end

end #class end
