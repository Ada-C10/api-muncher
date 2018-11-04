require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.search(string)
    url = BASE_URL + "q=#{string}&" + "app_id=#{ID}&" + "app_key=#{KEY}&" + "to=100"

    response = HTTParty.get(url)
    recipe_list = []

    if response["hits"]
      response["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
    end

    return recipe_list
  end


  def self.find_recipe(id)
    uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"
    encoded_uri = URI.encode(uri)
    url = BASE_URL + "r=#{encoded_uri}&" + "app_id=#{ID}&" + "app_key=#{KEY}"

    response = HTTParty.get(url)

    # recipe = create_recipe(" ")
    if response[0]
      recipe = create_recipe(response[0])
    end

    return recipe
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      {
        uri: api_params["uri"],
        source: api_params["source"],
        image: api_params["image"],
        ingredients: api_params["ingredientLines"],
        diet_labels: api_params["dietLabels"]
      }
    )
  end

end
