require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]


  # curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free"

  def self.list_recipes(ingredients)
    url = BASE_URL + "search?q=#{ingredients}" + "&app_id=#{ID}&app_key=#{KEY}&to=100"

    data = HTTParty.get(url)
      recipe_list = []
      if data["hits"]
        data["hits"].each do |recipe|
          recipe_list << recipe_hits(recipe["recipe"])
        end
      end
      return recipe_list
    end


    def self.find_recipe(id)
      url = BASE_URL + "search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"

      data = HTTParty.get(url)

        # recipe_list = []
      return recipe_hits(data[0])

    end



  private

  def self.recipe_hits(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      {
        ingredients: api_params["ingredientLines"],
        health: api_params["healthLabels"],
        image: api_params["image"],
        url: api_params["url"]
      }
    )
  end

end
