require 'httparty'

class EdamamApiWrapper

  BASE_URL = 'https://api.edamam.com/search'
  TOKEN = ENV['EDAMAM_TOKEN']
  ID = ENV['EDAMAM_ID']

  def self.list_recipes(search_terms)
    url = "#{BASE_URL}?q=#{search_terms}&app_id=#{ID}&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
      # binding.pry
    end
    return recipe_list
  end

  def self.list_recipe(id)
    url = "#{BASE_URL}?app_id=#{ID}&app_key=#{TOKEN}&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}"
    # Send the request
    HTTParty.get(url).parsed_response
  end

  private

  def self.create_recipe(api_params)

    return Recipe.new(
      api_params["label"],
      api_params["image"],
      api_params["uri"],
      api_params["url"],
      api_params["ingredients"],
      id: ( URI.encode( api_params["uri"] ) )[/[^_]+$/],
      dietLabels: api_params["dietLabels"]
    )

  end

end
