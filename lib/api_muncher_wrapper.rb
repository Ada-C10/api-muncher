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


  def self.recipe_by_uri(uri)

    @uri = uri

    url = BASE_URL + "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{@uri}&app_id=" + APP_ID + "&app_key=" + APP_KEY

    response = HTTParty.get(url)

    if response[0]
      return response[0]
    else
      return []
    end

  end

end
