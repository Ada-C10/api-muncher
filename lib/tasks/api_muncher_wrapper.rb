require 'httparty'


class ApiMuncherWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  def self.list_recipes(query, page)
    url = BASE_URL + "?q=#{query}" + "&app_id=#{APP_ID}" +  "&app_key=#{APP_KEY}" + "&to=30"

    # "&exclude_archived=1"

    data = HTTParty.get(url)

    recipe_list = []
    if data["hits"]
      data["hits"].each do |hit|
        recipe_list << create_recipe(hit["recipe"])
      end
    end

    return recipe_list
  end

  def self.show_details(uri)
    url = BASE_URL + "?r=#{uri}" + "&app_id=#{APP_ID}" +  "&app_key=#{APP_KEY}"
    
    data = HTTParty.get(url)
    create_recipe(data.first)
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      id_from_uri(api_params["uri"]),

      {
        image: api_params["image"],
        url: api_params["url"],
        ingredients: api_params["ingredientLines"],
        diet_labels: api_params["dietLabels"],
        health_labels: api_params["healthLabels"]

      }
    )
  end

  def self.id_from_uri(uri)
    return uri.split("_").last

  end




end
