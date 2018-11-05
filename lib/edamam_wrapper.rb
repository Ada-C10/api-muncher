require 'httparty'
require 'recipe'

class EdamamWrapper
  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.search(queery, page = nil)
    url = BASE_URL + "app_id=#{ID}&" + "app_key=#{KEY}&" + "q=#{queery}"
    if page
      from = (page * 10) - 10
      to = from + 10
      data = HTTParty.get(url + "&from=#{from}&to=#{to}")
    else
      data = HTTParty.get(url)
    end

    if data.include?("Error")
      return recipe_squeezer([{"recipe"=> {"label"=> "API Error... too many requests most likely. Please wait for cool down..."}}])
    elsif data["hits"] != []
      return recipe_squeezer(data["hits"])
    elsif page > 1 && data["hits"] == []
      return recipe_squeezer([{"recipe"=> {"label"=> "looks like there are no further results for this search!"}}])
    else
      return recipe_squeezer([{"recipe"=> {"label"=> "looks like there were no results for this search"}}])
    end
  end

  def self.recipe(ref)
    if ref.include?("http://www.edamam.com/ontologies/edamam.owl")
      url = BASE_URL + "app_id=#{ID}&" + "app_key=#{KEY}&" + "r=#{ref}"
    else
      url = BASE_URL + "app_id=#{ID}&" + "app_key=#{KEY}&" + "q=#{ref}"
    end

    encoded_url = URI.encode(url)
    data = HTTParty.get(encoded_url)

    if data.include?("Error")
      recipe = Recipe.new({"label"=> "API Error... too many requests most likely. Please wait for cool down..."})
    elsif data.include?("hits") && data["hits"] != []
      recipe = recipe_squeezer(data["hits"]).first
    elsif data.include?("hits") == false
      formatted = [{"recipe"=> data[0]}]
      recipe = recipe_squeezer(formatted).first
    else
      recipe = Recipe.new({"label"=> "sorry, no results for this query"})
    end

    return recipe
  end

  private

  def self.recipe_squeezer(hits)
    squeezed_recipes = []
    hits.each do |hash|
      squeezed_recipes << Recipe.new(hash["recipe"])
    end

    return squeezed_recipes
  end

end
