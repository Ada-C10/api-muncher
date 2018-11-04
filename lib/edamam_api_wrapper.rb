require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  TOKEN = ENV["EDAMAM_TOKEN"]
  APP_ID = ENV["EDAMAM_ID"]

  def self.search(word)
    # formatted_word = word.split.join("+")
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{TOKEN}" + "&to=50" + "&q=#{word}"
    formatted_url = URI.encode(url)
    data = HTTParty.get(formatted_url)

    all_recipes = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        all_recipes << create_recipe(recipe_data["recipe"])
      end
      return all_recipes
    else
      return []
    end
  end

  def self.show_recipe(id)

    add = URI.encode(uri_from_id(id))
    url = BASE_URL + "?app_id=#{APP_ID}" + "&app_key=#{TOKEN}" + "&r=#{add}"
    # formatted_url = URI.encode_with(url)
    # added = url.gsub(":", "%3A")
    data = HTTParty.get(url)
    # binding.pry
    h = data[0]
    return create_recipe(h)
  end

  private

  def self.create_recipe(recipe)
    # binding.pry
    return Recipe.new(
      id_from_uri(recipe["uri"]),
      recipe["label"],
      recipe["image"],
      recipe["url"],
      recipe["ingredientLines"],
      recipe["dietLabels"],
      recipe["source"]
    )
  end

  def self.id_from_uri(uri)
    # binding.pry
    uri.match(/#recipe_(.*)$/)[-1]
  end

  def self.uri_from_id(id)
    "http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"
  end
end
