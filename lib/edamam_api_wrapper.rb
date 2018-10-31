require 'httparty'
require 'pry'


class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  KEY = ENV["APP_KEY"]
  ID = ENV["APP_ID"]


  def self.list_recipes(ingredients)
  url = BASE_URL + "search?" + "app_id=#{ID}&app_key=#{KEY}"

  data = HTTParty.post(url,

  body: {
    "q" => "#{ingredients}"
  },
    :headers => { 'Content-Type' => 'application/x-www-form-urlencoded'})


recipe_list = []
  if data["hits"]

    data["hits"].each do |recipe|
      recipe_list << create_recipe(recipe["recipe"])
    end
  end
   return recipe_list


end

def self.single_recipe(id)

  url= BASE_URL + "search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"
  data = HTTParty.get(url)

  return create_recipe(data[0])

end

  private

def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      {
        image: api_params["image"],
        url: api_params["url"],
        ingredients: api_params["ingredientLines"],
        health: api_params["healthLabels"]
      }
    )
  end
end
