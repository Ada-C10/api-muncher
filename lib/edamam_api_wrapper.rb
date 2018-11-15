class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(query)
    url = BASE_URL + "search?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{query}" + "&to=100"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"].length > 0
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
    end
    return recipe_list
  end

  def self.display_recipe(id)
    url = BASE_URL + "search?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&r=#{URI.encode("http://www.edamam.com/ontologies/edamam.owl#recipe_")}#{URI.encode(id)}"
    data = HTTParty.get(url).first

    return create_recipe(data) if data
  end

  private

    def self.create_recipe(api_params)
      return Recipe.new(
        api_params["label"],
        api_params["image"],
        api_params["uri"],
        health_info: api_params["healthLabels"],
        ingredients: api_params["ingredientLines"],
        url: api_params["url"]
      )
    end

end
