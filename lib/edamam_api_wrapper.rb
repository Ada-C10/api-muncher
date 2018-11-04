require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  EDAMAM_APP_ID = ENV['EDAMAM_APP_ID']
  EDAMAM_APP_KEY = ENV['EDAMAM_APP_KEY']

  def self.find_recipes(query_type, query_string)

    url = BASE_URL + '?'+ query_type + '=' + URI.encode(query_string)+ '&app_id=' + EDAMAM_APP_ID + '&app_key=' + EDAMAM_APP_KEY + '&from=0&to=50'

    response = HTTParty.get(url)
    if response.key? "hits"
      return_recipes(response)
    elsif response[0].key? "uri"
      return_single_recipe(response[0])
    else
      return []
    end
  end

  private

  def self.return_single_recipe(api_params)

    if api_params
      return Recipe.new(api_params["label"],
        {
          ingredients: api_params["ingredientLines"],
          uri: api_params["uri"],
          url: api_params["url"],
          image_url: api_params["image"],
          dietary_info: api_params["dietLabels"],
          health_info: api_params["healthLabels"]
        }
      )

    else
      return "Not Found"
    end
  end

  def self.return_recipes(response)
    if response["hits"]
      recipe_list = response["hits"].map do |hit|
        create_recipe_from_hit(hit)
      end
    else
      return []
    end
    return recipe_list
  end

  def self.create_recipe_from_hit(api_params)
    return Recipe.new( api_params["recipe"]["label"],
      {
        ingredients: api_params["recipe"]["ingredientLines"],
        uri: api_params["recipe"]["uri"],
        url: api_params["recipe"]["url"],
        image_url: api_params["recipe"]["image"],
        dietary_info: api_params["recipe"]["dietLabels"],
        health_info: api_params["recipe"]["healthLabels"]
      }
    )
  end
end
