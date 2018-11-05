require 'httparty'

class EdamamApiWrapper
  BASE_URL = 'https://api.edamam.com/'
  APP_ID = ENV['APP_ID']
  APP_KEY = ENV['APP_KEY']

  # TODO: CHANGE

  # TODO: encode

  # def self.search_term(query)
  #   return query
  # end


  def self.list_recipes(search_term)
    # search_term = "quinoa"

    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"
    encoded_url = URI.encode(url) # break out into separate function?

    data = HTTParty.get(encoded_url)
    # data = data.parsed_response

    list_of_recipe_hashes = data["hits"]
    relevant_recipes_list = []

    if list_of_recipe_hashes
      list_of_recipe_hashes.each do |recipe|
        relevant_recipes_list << build_recipe(recipe["recipe"])
      end
    end
    #	return data['channels']

    return relevant_recipes_list #so else is like return []
  end

  def self.show_single_recipe(uri_num)
    # ex: http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_186eac9959d3fc7e9415107ee77a1e2c
    uri_start = "http://www.edamam.com/ontologies/edamam.owl#"

    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&r=#{uri_start}" + "#{uri_num}"
    encoded_url = URI.encode(url)

    data = HTTParty.get(encoded_url) #array with hash inside

    # data = data.parsed_response
    if data
      return build_recipe(data[0])
      # QUESTION: return argument error?
    else
      return nil
    end

  end

  private

  def self.build_recipe(recipe_hash)
    if recipe_hash
      return Recipe.new(
        name: recipe_hash["label"],
        url: recipe_hash["url"],
        ingredients_list: recipe_hash["ingredientLines"], #array
        dietary_info: recipe_hash["dietLabels"], #array
        health_info: recipe_hash["healthLabels"], #array
        photo: recipe_hash["image"],
        uri_num: recipe_hash["uri"]
      )

    end
  end
end
