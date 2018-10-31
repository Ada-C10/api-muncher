require 'httparty'
require 'pry'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = "5d462879"
  KEY = "21e92c993e17ec0b8fd8a81096405aa9"

  def self.send_msg(search)
    puts "Retrieving EDAMAM Recipes for the search term #{search}"

    url = BASE_URL + "?q=#{search}" + "&app_id=#{ID}&app_key=#{KEY}" + "&from=0&to=1"
    response = HTTParty.get(url)
    binding.pry
    return response
  end

#response["hits"][0]["recipe"]
end
