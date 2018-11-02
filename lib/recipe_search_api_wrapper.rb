class RecipeSearchApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.get_recipes(flavor)

    #modify so that flavor can take in multiple search terms separated by however many spaces, exclude non letters

    url = BASE_URL + "?q=#{flavor}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

    response = HTTParty.get(url)

    if response["hits"]
      recipes = response["hits"].map { |recipe_hit| create_recipe(recipe_hit) }
    end
    # fail

    return recipes

  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["recipe"]["label"],
      api_params["recipe"]["uri"],
      api_params["recipe"]["source"],
      api_params["recipe"]["image"],
      api_params["recipe"]["ingredientLines"],
      api_params["recipe"]["dietLabels"]
    )

  end




end
