require 'httparty'

class ApiMuncherWrapper

  BASE_URL = "https://api.edamam.com/search"
  APP_ID = ENV["APP_ID"]
  APP_KEY = ENV["APP_KEY"]

  def self.recipes_by_ingredient(ingredient)

    @ingredient = ingredient

    url = BASE_URL + "?q=#{@ingredient}&from=0&to=20&app_id=" + APP_ID + "&app_key=" + APP_KEY

    response = HTTParty.get(url)

    if response["hits"]
      return response["hits"]
    else
      return []
    end

  end

end
