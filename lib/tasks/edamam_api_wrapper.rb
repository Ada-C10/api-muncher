equire 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]



  def self.list_recipes(term)
  url = BASE_URL + "search?" + "app_key=#{KEY}" + "&app_id=#{ID}" +"&q=#{term}"
  data = HTTParty.get(url)
  recipe_list = []
  if data["hits"]
    data["hits"].each do |recipe|
      recipe_list << create_recipe(recipe)
    end
  end
  return recipe_list
end


  private

def self.create_recipe(api_params)
    return Recipe.new(
      api_params["name"],
      api_params["id"],
      {
        purpose: api_params["purpose"],
        is_archived: api_params["is_archived"],
        members: api_params["members"]
      }
    )
  end
end
