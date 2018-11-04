require 'httparty'

class ApiMuncherWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.recipes_by_ingredient(ingredient)

    @ingredient = ingredient

    url = BASE_URL + "?q=#{@ingredient}&from=0&to=100&app_id=" + APP_ID + "&app_key=" + APP_KEY

    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << add_recipes(recipe_data)
      end
    end
    return recipe_list
  end



  def self.recipe_by_uri(uri)

    @uri = uri

    url = BASE_URL + "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{@uri}&app_id=" + APP_ID + "&app_key=" + APP_KEY

    response = HTTParty.get(url)


    if response[0]
      returned_recipe = get_single_recipe(response[0])
      return returned_recipe
    end
  end


  private

  def self.add_recipes(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["uri"],
      api_params["recipe"]["image"],
      api_params["recipe"]["source"],
      api_params["recipe"]["dietLabels"],
      api_params["recipe"]["ingredientLines"]
    )
  end

  def self.get_single_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      api_params["image"],
      api_params["source"],
      api_params["dietLabels"],
      api_params["ingredientLines"]
    )
  end

end
