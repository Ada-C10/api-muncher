require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  URL2 =  "http:%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#"
  TOKEN = ENV["app_key"]
  ID = ENV["app_id"]
  NUM = 50

  def self.list_recipes(word)
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{TOKEN}" + "&q=#{word}" + "&to=#{NUM}"

    data = HTTParty.get(url)

    # data = URI.encode(url)

    recipe_list = []

    if data["hits"]
      data["hits"].each do |hit|
        recipe = Recipe.new(
          hit["recipe"]["label"],
          hit["recipe"]["uri"],
          hit["recipe"]["image"],
          hit["recipe"]["url"],
          hit["recipe"]["dietLabels"],
          hit["recipe"]["healthLabels"],
          hit["recipe"]["ingredientLines"],

        )
        recipe_list << recipe
      end
    end
    return recipe_list
  end

  # in the uri there is a uniq sequence of numbers that is id for the recipe
  def self.show_recipe(uri)

    url = BASE_URL + "r=#{URL2}#{uri}" + "&app_id=#{ID}" + "&app_key=#{TOKEN}"

    # url = URI.encode(url)

    data = HTTParty.get(url)

    recipe = Recipe.new(
      data[0]["label"],
      data[0]["uri"],
      data[0]["image"],
      data[0]["url"],
      data[0]["dietLabels"],
      data[0]["healthLabels"],
      data[0]["ingredientLines"]

    )

    return recipe


  end

  private

  # def self.create_recipe(api_params)
  #
  #   return Recipe.new(
  #       label: api_params["label"],
  #       uri: api_params["uri"],
  #       image: api_params["image"],
  #       url: api_params["url"],
  #       dietLabels: api_params["dietLabels"],
  #       healthLabels: api_params["healthLabels"],
  #       ingredientLines: api_params["ingredientLines"]
  #   )
  # end
  #
  # def self.create_single_recipe(api_params)
  #   return Recipe.new(
  #     {
  #       image: ["image"],
  #       uri: ["uri"],
  #       label: ["label"],
  #       url: ["url"],
  #       dietLabels: ["dietLabels"],
  #       healthLabels: ["healthLabels"],
  #       ingredientLines: ["ingredientLines"]
  #     }
  #   )
  # end


end
