require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  KEY = ENV["APP_KEY"]
  APP_ID = "248ddc1b" #ENV["APP_ID"]

  def self.list_recipes(word)
    url = BASE_URL + "q=#{word}" + "&app_id=#{ APP_ID }" +
    "&app_key=#{ KEY }" + "&to=100"
    data = HTTParty.get(url)
    recipe_list = []
    # binding.pry
    if data["hits"]
      data["hits"].each do |hit_data|
        recipe_list << create_recipe(hit_data)
      end
      return recipe_list
    else
      return []
    end
  end

  def self.show_recipe(id)
    uri_first = URI.encode("http://www.edamam.com/ontologies/edamam.owl#recipe")
    url = BASE_URL + "r=#{uri_first}" + "_#{id}" + "&app_id=#{ APP_ID }" +
    "&app_key=#{ KEY }"

    data = HTTParty.get(url)
    if data.any?
      name = data[0]["label"]
      image = data[0]["image"]
      uri = data[0]["uri"]

      Recipe.new(name, image, uri, {dietary_info: data[0]["healthLabels"], ingredients: data[0]["ingredientLines"], recipe_link: data[0]["url"] })
    else
      return nil #or does ArgumentError in recipe class take care of this?
    end
  end

  private

  def self.create_recipe(api_params)
    Recipe.new(
    api_params["recipe"]["label"],
    api_params["recipe"]["image"],
    api_params["recipe"]["uri"],
    {
      dietary_info: api_params["healthLabels"],
      ingredients: api_params["ingredients"],
      recipe_lnk: api_params["url"]
    }
  )
  end
end
