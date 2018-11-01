require 'httparty'

class EdamamApiWrapper
  BASE_URL = 'https://api.edamam.com/search?'
  TOKEN = ENV['EDAMAM_TOKEN']
  APP_ID = ENV['EDAMAM_APP_ID']

  def self.search_recipes(food)
    url = BASE_URL + "app_id=#{APP_ID}" + "&app_key=#{TOKEN}" + "&q=#{food}"
    data = HTTParty.get(url)

    recipes_search_result = []

    if data["hits"]
        data["hits"].each do |recipe_data|
          recipes_search_result << create_recipe(recipe_data["recipe"])

        end
    else
      #error no recipe found
    end

    return recipes_search_result
  end

  def self.create_recipe(api_params)
    
    return Recipe.new(
      name: api_params["label"],
      creator: api_params["source"],
      image: api_params["image"],
      recipe_link: api_params["url"],
      ingredients: api_params["ingredientLines"],
      dietary_labels: api_params["dietLabels"]
    )
  end

end
