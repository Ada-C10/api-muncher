require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.list_recipes(params)
    term = params[:search]
    diet = params[:diet]

    url = BASE_URL + "?q=#{term}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&from=0" + "&to=50"

    if diet
      diet.each do |label|
        url += "&diet=#{label}"
      end
    end

    data = HTTParty.get(url)

    recipe_list = []

    if data.code == 403
      return []
    elsif data["hits"].empty?
      return []
    else
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
      return recipe_list
    end
  end

  def self.recipe_details(id)
    url = BASE_URL + "?&app_id=#{ID}" + "&app_key=#{KEY}" + "&r=http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"

    encoded_url = URI.encode(url)
    data = HTTParty.get(encoded_url)

    if data.parsed_response.empty?
      return []
    else
      return recipe_data(data)
    end
  end


  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["image"],
      api_params["recipe"]["uri"]
    )
  end

  def self.recipe_data(api_params)
    return Recipe.new(
      api_params[0]["label"],
      api_params[0]["image"],
      api_params[0]["uri"],
      original_url: api_params[0]["url"],
      ingredients: api_params[0]["ingredientLines"],
      diet_labels: api_params[0]["dietLabels"],
      health_labels: api_params[0]["healthLabels"],
      source: api_params[0]["source"]
    )
  end
end
