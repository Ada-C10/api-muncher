require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["EDAMAM_ID"]

  def self.search(word)
    formatted_word = word.split.join("+")
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{TOKEN}" + "&q=#{formatted_word}"

    data = HTTParty.get(url)
    if data["hits"]
      return data["hits"]
    else
      return []
    end
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
