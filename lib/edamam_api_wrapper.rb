require 'httparty'
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  QUERY_ALL = "search?q="
  RETURN_RECIPE = ""
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
# def self.search_recipes(search_param)
  def self.search_recipes(search_term)

    url = BASE_URL + QUERY_ALL + "#{search_term}" + "&app_id=" + ID + "&app_key=" + KEY
    recipes = HTTParty.get(url)

    recipes_found = []

    if recipes["hits"]
      recipes["hits"].each do |recipe_data|
        recipes_found << create_recipe(recipe_data["recipe"])
      end
    end

    return recipes_found
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(api_params)
  end

end
