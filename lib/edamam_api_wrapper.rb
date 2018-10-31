require 'httparty'

class EdamamApiWrapper

  BASE_URL = 'https://api.edamam.com/search'
  TOKEN = ENV['EDAMAM_TOKEN']
  ID = ENV['EDAMAM_ID']

  def self.list_recipes(search_terms)
    url = "#{BASE_URL}?q=#{search_terms}&app_id=#{ID}&app_key=#{TOKEN}"
    data = HTTParty.get(url)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
      # binding.pry
    end
    return recipe_list
  end

  def self.list_recipe(recipe_uri)
    # https://api.edamam.com/search?app_id=398bf3f1&app_key=89efbe3d72902458d8f7526eb456041b&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_9b5945e03f05acbf9d69625138385408
    # Get rid of odd characters
    encoded_uri = URI.encode(recipe_uri)
    url = "#{BASE_URL}?&app_id=#{ID}&app_key=#{TOKEN}&r=#{encoded_uri}"

    # Send the request
    HTTParty.get(encoded_uri).parsed_response

  end

  # def self.send_msg(search_terms)
  #   puts "Sending search terms to find recipes"
  #
  #   url = "#{BASE_URL}?q=#{search_terms}&app_id=#{ID}&app_key=#{TOKEN}"
  #   response = HTTParty.post(url,
  #     body: {
  #
  #     },
  #     :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' }
  #   )
  #   return response.success?
  #
  #   # url = BASE_URL +
  #
  # end

  # def self.send_search(message)
  #   url = BASE_URL +
  #
  # end



  private

  def self.create_recipe(api_params)

    return Recipe.new(
      api_params["label"],
      api_params["image"],
      api_params["uri"],
      api_params["url"],
      api_params["ingredients"],
      dietLabels: api_params["dietLabels"]
    )

  end

  # http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_7bf4a371c6884d809682a72808da7dc2
  # Swap out end with the number of the recipe somehow
end
