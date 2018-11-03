  require 'httparty'

  class EdamamApiWrapper
    BASE_URL = "https://api.edamam.com/"
    ID = ENV["EDAMAM_ID"]
    KEY = ENV["EDAMAM_KEY"]


    def self.search_recipes(search_term)
      url = BASE_URL + 'search?' + "q=#{search_term}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
      data = HTTParty.get(url)
      @recipe_list = []
      if data['hits']
        data['hits'].each do |recipe_data|
          @recipe_list << create_recipe(recipe_data['recipe'])
        end
        return @recipe_list
      else
        return nil
      end
    end

    # def self.find_recipe(id)
    #   url = BASE_URL + "search?" + "q=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{id}" + "&app_id=#{ID}&app_key=#{KEY}"
    #   data = HTTParty.get(url)
    #   if data.length > 0
    #     recipe = create_recipe(data[0])
    #     return recipe
    #   else
    #     return nil
    #   end
    # end

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
