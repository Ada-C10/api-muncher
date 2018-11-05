require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]


  def self.list_recipes(query)

    url = BASE_URL + query + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)
    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << recipe_data["recipe"]["label"]
      end
    end

    return recipe_list
  end
  
  private

  def self.create_recipe(api_params)
    return Recipe.new(
      # api_params["name"],
      # api_params["id"],
      # {
      #   purpose: api_params["purpose"],
      #   is_archived: api_params["is_archived"],
      #   members: api_params["members"]
      # }
    )
  end

end
