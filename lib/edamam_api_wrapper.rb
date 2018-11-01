require 'httparty'

class EdamamApiWrapper
  BASE_URL = 'https://api.edamam.com/'
  APP_ID = ENV['APP_ID']
  APP_KEY = ENV['APP_KEY']

  # TODO: CHANGE

  # TODO: encode

  def self.list_recipes
    search_term = "quinoa"

    url = BASE_URL + "search?" + "app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&q=#{search_term}"
    encoded_url = URI.encode(url) # break out into separate function?

    data = HTTParty.get(encoded_url)
    data = data.parsed_response

    list_of_recipe_hashes = self.parse_api_hash(data)
    relevant_recipes_list = []

    list_of_recipe_hashes.each do |recipe|
      relevant_recipes_list << build_recipe(recipe)
    end
    #	return data['channels']

    return relevant_recipes_list #so else is like return []
  end

  # def self.send_message(channel, message)
  #   url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
  #
  #   HTTParty.post(url,
  #     body: {
  #       "text" => message,
  #       "channel" => channel,
  #       "username" => "Roberts-Robit",
  #       "icon-emoji" => ":robot-face",
  #       "as_user" => false
  #     },
  #     :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  #     return response.success?
  #
  #   end

  private

  def self.parse_api_hash(api_params_hash)
    raw_hits_list = api_params_hash["hits"]

    # QUESTION: maybe instead check # hits
    # if !raw_hits_list
    #   raise ArgumentError, "EXPECTED DATA NOT THERE" # TODO: if/else with [] tho
    # end

    list_of_recipe_hashes = []

    raw_hits_list.each do |recipe|
      recipe_hash = {}

      recipe_hash[:name] = recipe["recipe"]["label"]
      recipe_hash[:url] = recipe["recipe"]["url"]
      recipe_hash[:ingredients_list] = recipe["recipe"]["ingredientLines"] #array
      recipe_hash[:photo] = recipe["recipe"]["image"]
      # TODO: add dietary info here

      list_of_recipe_hashes<< recipe_hash
    end

    return list_of_recipe_hashes
  end


  def self.build_recipe(recipe_hash)
    return Recipe.new(
      name: recipe_hash[:name],
      url: recipe_hash[:url],
      ingredients_list: recipe_hash[:ingredients_list],
      photo: recipe_hash[:photo],
    )
  end
end
