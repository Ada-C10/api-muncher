require 'httparty'
class EdamamApiWrapper

  BASE_URL = "https://api.edamam.com/search?"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]


  def self.search_recipes
    @url = BASE_URL + 'search?' + "q=#{search_term}" + "&app_id=#{EDAMAM_ID}" + "&app_key=#{EDAMAM_KEYS}"
    data = httparty.get(url)

    @recipe_list = []
    if data['hits'] > 0
      data['hits'].each do |recipe_data|
        @recipe_list << create_recipe(recipe_data['recipe'])
      end
      return @recipe_list
    else
      return nil
    end
    def self.search_specific(id)
      url = BASE_URL + "search?" + "r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"
      data = httparty.get(url)
      if data.length > 0
        recipe = create_recipe(data[0])
        return recipe
      else
        return nil
      end
    end

    private

    def self.create_recipe(api_params)
      if api_params["uri"]
        uri = api_params["uri"]
        uri =  api_params["uri"].partition("_").last if api_params["uri"].include? ("_")
      end
      return Recipe.new(
        api_params["label"],
        uri,
        {
          url: api_params["url"],
          img: api_params["image"],
          ingredients: api_params["ingredientLines"],
          dietary_information: api_params["healthLabels"],
          author: api_params["source"]
        }
      )
    end
  end


  def initialize(response)
    @label = response['hits']['label']
    @location = response['hits']['image']
    @icon = response['hits']['url']
    @desc = response['hits']['dietLabels']
  end
end
