require 'httparty'

class ApiMuncherWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]


  def self.list_recipes
    url = BASE_URL + "?q=tempeh" + "&app_id=#{APP_ID}" +  "&app_key=#{APP_KEY}"

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


private

  def self.create_recipe(api_params)
      return Recipe.new(
        api_params["label"],

        {
          image: api_params["image"],

        }
      )
    end




end
