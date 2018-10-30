class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(query)
    url = BASE_URL + "search?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{query}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"].length > 0
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end
    return recipe_list
  end

  private

    def self.create_recipe(api_params)
      return Recipe.new(
        api_params["recipe"]["label"],
        api_params["recipe"]["image"], 
        {}
        # {
        #   purpose: api_params["purpose"],
        #   is_archived: api_params["is_archived"],
        #   members: api_params["members"]
        # }
      )
    end

end
