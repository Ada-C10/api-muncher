class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.recipe_search(keyword)
    url = BASE_URL + "q=#{keyword}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)
    data["hits"].each do |hit|
      recipe_name = hit["recipe"]["label"]
      recipe_image = hit["recipe"]["image"]
      recipe_uri = hit["recipe"]["uri"]
    end
    # do something with these - create recipe instances?
  end

  def self.show_recipe(uri)
    url = BASE_URL + "r=#{uri}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)
    data[0]["label"]
    data[0]["image"]
    data[0]["url"]
    data[0]["ingredientLines"]  # this is an array
    data[0]["healthLabels"] # this is an array


    #
# Name
# Link to the original recipe (opens in a new tab)
# Ingredients
# Dietary information  which info????

  end

end
