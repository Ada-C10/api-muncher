require 'httparty'
require 'pry'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.send_msg(search)
    puts "Retrieving EDAMAM Recipes for the search term #{search}"

    url = BASE_URL + "?q=#{search}" + "&app_id=#{ID}&app_key=#{KEY}" + "&from=0&to=19"
    response = HTTParty.get(url)
    return response
  end

#response["hits"][0]["recipe"]
end
