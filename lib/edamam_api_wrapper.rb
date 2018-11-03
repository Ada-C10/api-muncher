require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.send_search(search, labels)
    url = BASE_URL + "?q=#{search}" + "&app_id=#{ID}&app_key=#{KEY}" + "&from=0&to=29"
    if !labels.empty?
      url << "&health="
      labels.each do |tag|
        url << tag + "&"
      end
    end

    response = HTTParty.get(url)
    if response["hits"] == nil || response["hits"] == []
      return nil
    else
      return response["hits"].map {|recipe| EdamamApiWrapper.create_recipe(recipe["recipe"])}
    end
  end

  def self.retrieve_recipe(id)
    puts "Retrieving user's requested recipe: #{id}"

    url = BASE_URL + "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"
    response = HTTParty.get(url)
    return response
  end


  def self.create_recipe(recipe_params)
    return Recipe.new(
      name: recipe_params["label"],
      id: recipe_params["uri"].match(/recipe_(.+)/).captures,
      url: recipe_params["url"],
      image: recipe_params["image"],
      ingredients: recipe_params["ingredients"].map {|item| item["text"]},
      calories: recipe_params["calories"].round(0),
      health_labels: recipe_params["healthLabels"]
    )
  end

end
