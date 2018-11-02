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

    if data["hits"] != []
      return recipe_squeezer(data["hits"])
    elsif page > 1 && data["hits"] == []
      puts "elsif"
      return recipe_squeezer([{"recipe"=> {"label"=> "looks like there are no further results for this search!"}}])
    else
      puts "else"
      return recipe_squeezer([{"recipe"=> {"label"=> "looks like there were no results for this search"}}])
    end
  end

  private

  def self.recipe_squeezer(hits)
    squeezed_recipes = []
    hits.each do |hash|
      squeezed_recipes << Recipe.new(hash["recipe"])
    end

    return squeezed_recipes
  end

  def self.recipe(title)
    url = BASE_URL + "app_id=#{ID}&" + "app_key=#{KEY}&" + "q=#{title}"
    data = HTTParty.get(url)
    if data["hits"]
      recipe = recipe_squeezer(data["hits"]).first
    end

    return {
      "title"=> recipe.title,
      "image"=> recipe.image,
      "url"=> recipe.url,
      "source"=> recipe.source,
      "health_labels"=> recipe.health_labels,
      "diet_labels"=> recipe.diet_labels,
      "calories"=> recipe.calories,
      "ingredients"=> recipe.ingredients
    }
  end
end
