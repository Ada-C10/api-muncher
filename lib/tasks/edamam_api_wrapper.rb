require 'httparty'

class EdamamApiWrapper

BASE_URL = "https://api.edamam.com/"
KEY = ENV["APP_KEY"]
ID = ENV["APP_ID"]


# curl "https://api.edamam.com/search?q=chicken&app_id=${YOUR_APP_ID}&app_key=${YOUR_APP_KEY}&from=0&to=3&calories=591-722&health=alcohol-free"


# def self.list_recipe(ingredients)
#   url = BASE_URL + "search?" + "q=#{ingredients}" + "app_id=$#{ID}&app_key=$#{KEY}"
#   data = HTTParty.get(url)
#   recipe_list = []
#   if data["hits"]
#     data["hits"].each do |recipe|
#       recipe_list << recipe_hits(recipe["recipe"])
#     end
#   end
#   return recipe_list
# end


def self.list_recipe(ingredients)
  url = BASE_URL + "search?" + "q=#{ingredients}" + "app_id=$#{ID}&app_key=$#{KEY}"
  data = HTTParty.get(url)
  recipe_list = []
  if data["hits"]
    data["hits"].each do |recipe|
      recipe_list << recipe_hits(recipe["recipe"])
    end
  end
  return recipe_list
end






# def self.search_results
#   url =  BASE_URL + "search?" + "q=#{ingredients}" + "app_id=$#{ID}&app_key=$#{KEY}"
#   response = HTTParty.post(url,
#         body:  {
#         "text" => "#{ingredients}",
#         "channel" => "#{channel}",
#         "username" => "I wish upon...",
#         "icon_emoji" => ":star2:",
#         "as_user" => "false"
#       },
#
#       #   api_params["label"],
#       #   api_params["uri"],
#       #   {
#       #     :ingredients = options[:ingredients]
#       #     :health = options[:healthLabels]
#       #     :image = options[:image]
#       #     :url = options[:url]
#       #   }
#       # )
#   :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
#       return response.success?
#     end

private

def self.recipe_hits(api_params)
  return Recipe.new(
    api_params["label"],
    api_params["uri"],
    {
      :ingredients = options[:ingredients]
      :health = options[:healthLabels]
      :image = options[:image]
      :url = options[:url]
    }
  )
end
