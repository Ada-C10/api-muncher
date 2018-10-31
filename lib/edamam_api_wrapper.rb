require 'httparty'
# require 'awesome_print'
#purpose of api  wrapper
#api wrapper protects us from changes from someone eslse server
#take in dta for us #make it nice and neat #hand it to the rest of the program in a uniform way

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/"
  APP_ID = ENV["APP_ID"] #this keeps our token private
  APP_KEY = ENV["APP_KEY"]


  #list the channels  **
  def self.list_recipes(user_search)
    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{user_search}"
    encoded_url = URI.encode(url) #add this because the user might search for something with spaces and this gets rid
    data = HTTParty.get(encoded_url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
    end
    return recipe_list
  end

  def self.search_recipes(user_search)
  end



  private

  def self.create_recipe(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["uri"],
      {
        healthLabels: api_params["healthLabels"],
        ingredients: api_params["ingredients"],
        image: api_params["image"],
        url:  api_params["url"]
      }
    )
  end
end #end of class method

#### delete everything under here
# [1] pry(EdamamApiWrapper)> create_recipe(data["hits"][0]["recipe"])
# => #<Recipe:0x007f9902d61f08
#  @healthLabels=["Vegetarian", "Peanut-Free", "Tree-Nut-Free", "Alcohol-Free"],
#  @image="https://www.edamam.com/web-img/bb2/bb221d581497fa559f5817ca1800ea65.jpg",
#  @ingredients=
#   [{"text"=>"1 ounce semisweet or bittersweet chocolate, per person", "weight"=>28.349523125, "foodCategory"=>"Pantry"},
#    {"text"=>"1 tablespoon water, per person", "weight"=>14.786764781, "foodCategory"=>"Beverages"},
#    {"text"=>"1 large egg, per person", "weight"=>50.0, "foodCategory"=>"Dairy"}],
#  @label="Chocolate Mousse",
#  @uri="http://www.edamam.com/ontologies/edamam.owl#recipe_7543ecfa28b7506a97360748f017a83e",
#  @url="http://leitesculinaria.com/74504/recipes-chocolate-mousse.html">
