require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.send_msg(search)
    puts "Retrieving EDAMAM Recipes for the search term #{search}"

    url = BASE_URL + "?q=#{search}" + "app_id=#{ID}&app_key=#{KEY}" + "&from=0&to=1"
    response = HTTParty.get(url)
    binding.pry
    return response
  end

end
