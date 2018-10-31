require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  KEY = ENV["APP_KEY"]
  APP_ID = "248ddc1b"

  def self.list_recipes(word)
    url = BASE_URL + "q=#{word}" + "&app_id=#{ APP_ID }" +
    "&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |hit|
        name = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"]
      end

      recipe_list << Recipe.new(name, image, uri)
      return recipe_list
    else
      return []
    end
  end

  def self.show_recipe(uri)
    url = BASE_URL + "r=#{uri}" + "&app_id=#{ APP_ID }" +
    "&app_key=#{ APP_KEY }"
    data = HTTParty.get(url)

    if data
      name = data[0]["label"]
      image = data[0]["image"]
      uri = data[0]["uri"]
      ingredients = data[0]["ingredientLines"]
      dietary_info = data[0]["healthLabels"]

      Recipe.new(name, image, uri, ingredients, dietary_info)
    else
      return nil #or does ArgumentError in recipe class take care of this?
    end
  end

  private

  def self.create_recipe(api_params)
    api_params[:label],
    api_params[:image],
    api_params[:uri]
    {
      dietary_info: api_params["dietary_info"],
      ingredients: api_params["ingredients"]
    }
  end
end
