require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://test-es.edamam.com/"
  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]

  def self.list_recipes(search_term)
    url = BASE_URL + "search?" + "q=#{search_term}"+"app_id=#{APP_ID}" + "app_id=#{APP_KEY}"
    data = HTTParty.get(url)
    if data["recipe"]
      return data["recipe"]
    else
      return []
    end
  end
end
