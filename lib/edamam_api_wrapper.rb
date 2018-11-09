require 'httparty'
class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  QUERY_ALL = "search?q="
  RETURN_RECIPE = "search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]
  # def self.search_recipes(search_param)
  def self.search_recipes(search_term)

    url = BASE_URL + QUERY_ALL + "#{search_term}" + "&app_id=" + ID + "&app_key=" + KEY + "&from=0&to=5000"
    recipes = HTTParty.get(url)

    recipes_found = []

    if recipes["hits"]
      recipes["hits"].each do |recipe_data|
        recipes_found << create_recipe(recipe_data["recipe"])
      end
    end

    return recipes_found
  end

  def self.find_recipe(recipe_uri)

    url = BASE_URL + RETURN_RECIPE + "#{recipe_uri}" + "&app_id=" + ID + "&app_key=" + KEY
    recipe = HTTParty.get(url)
    if recipe.empty?
      return recipe
    else
      recipe = create_recipe(recipe[0])
      return recipe
    end
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(api_params)
  end

end
