require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["app_key"]
  ID = ENV["app_id"]
  NUM = 50

  def self.list_recipes(word)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{word}" + "&to=#{NUM}"
    url = URI.encode(url)

    data = HTTParty.get(url)

    recipe_list = []

    if data["hits"]
      data["hits"].each do |hit|
        recipe_list << create_recipe(hit)

      end
    end
    return recipe_list
  end

  def show_recipe(uri)

  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      {
        image: api_params["recipe"]["image"],
        uri: api_params["recipe"]["uri"],
        label: api_params["recipe"]["label"],
        url: api_params["recipe"]["url"],
        yield: api_params["recipe"]["yield"],
        dietLabels: api_params["recipe"]["dietLabels"],
        healthLabels: api_params["recipe"]["healthLabels"],
        ingredientLines: api_params["recipe"]["ingredientLines"]
      }
    )


  end
end
