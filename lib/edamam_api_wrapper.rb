require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.search(string)
    url = BASE_URL + "q=#{string}&" + "app_id=#{ID}&" + "app_key=#{KEY}&" + "to=100"

    response = HTTParty.get(url)
    return response["hits"]
  end

end
# index:
#   syntax to get recipe name:
#   response["hits"][0]["recipe"]["label"]
#  returns string

#   syntax to get recipe image:
#   response["hits"][0]["recipe"]["image"]
#  returns string

# show:
#  syntax to get recipe URL:
#  response["hits"][0]["recipe"]["url"]
#  returns string

#  syntax to get recipe ingredients:
#  response["hits"][0]["recipe"]["ingredientLines"]
#  returns array

#  syntax to get dietary labels:
#  response["hits"][0]["recipe"]["dietLabels"]
#  returns array - some are empty - how to handle nil?
