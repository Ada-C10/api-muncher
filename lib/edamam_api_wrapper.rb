require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_KEY = ENV["APP_KEY"]
  APP_ID = ENV["APP_ID"]

  def self.list_recipes(query)
  # #   # recipes = []
  # #   #
  # #   # # TODO: Fetch real data
  # #   # # loop through all data for real recipes
  # #   # r = Recipe.new(query)
  # #   # recipes << r
  # #   #
  # #   # return recipes
    url = BASE_URL + "?q=#{query}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&to=300"

    # encoded_url = URI.encode(url)
    data = HTTParty.get(url)

    recipes = []

    # return data

    if data["hits"]
      data["hits"].each do |recipe_data|
      #   recipe = Recipe.new(
      #
      #     recipe_data["recipe"]["label"],
      #     recipe_data["recipe"]["uri"],
      #     recipe_data["recipe"]["image"],
      #     recipe_data["recipe"]["ingredientLines"],
      #     recipe_data["recipe"]["dietLabels"],
      #     recipe_data["recipe"]["url"]
      #   )
      #   recipes << recipe
        recipes << create_recipe(recipe_data["recipe"])
      end
    end
    return recipes
  end

  def self.show_recipe_detail(id)
    # recipe_id = id
    # uri = URI.encode("")
    @id = id

    link = "http://www.edamam.com/ontologies/edamam.owl#recipe_#{@id}"

    url = BASE_URL + "?&r=#{CGI.escape(link)}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    # binding.pry

    # new_url = CGI.escape(url(id))
    data = HTTParty.get(url).first

    #   result = Recipe.new(
    #     data[0]["label"],
    #     data[0]["uri"],
    #     data[0]["image"],
    #     data[0]["ingredientLines"],
    #     data[0]["dietLabels"],
    #     data[0]["url"]
    #     )
    #
    #
    # return result
    return create_recipe(data)
  end

  private

 #  def self.add_recipes(api_params)
 #   return Recipe.new(
 #     api_params["label"],
 #     api_params["uri"],
 #     api_params["image"]
 #   )
 # end

  def self.create_recipe(api_params)
    # binding.pry
    return Recipe.new(

      api_params["label"],
      api_params["uri"],
      api_params["image"],
      api_params["ingredientLines"],
      api_params["healthLabels"],
      api_params["url"],
      api_params["source"]
    )

    # return Recipe.new(
    #
    #   api_params["recipe"]["label"],
    #   api_params["recipe"]["uri"],
    #   api_params["recipe"]["image"],
    #   api_params["recipe"]["ingredientLines"],
    #   api_params["recipe"]["dietLabels"],
    #   api_params["recipe"]["url"]
    # )
  end

end
