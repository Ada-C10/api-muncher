require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.search_recipes(q)
    url =  BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{q}"

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    recipe_list = []

    if response["hits"]
      response["hits"].each do |hit|
        recipe_list << create_recipe(hit["recipe"])

      end
    end
    return recipe_list
  end

  # this is to create a new instance of recipe when a show recipe is called
  def self.show_recipe(id)
    # this is like the encoding thing but for this show page

    new_url = CGI.escape(uri_from_id(id))

    # this is passing in the new url instead of a quiery
    url = BASE_URL + "?app_id=#{ID}" + "&app_key=#{KEY}" + "&r=#{new_url}"

    response = HTTParty.get(url)
    # call on the first of the array of hashes
    return create_recipe(response[0])
  end

  private

  # using regex to get the last part of the uri
  def self.id_from_uri(uri)
    uri.match(/#recipe_(.*)$/)[-1]
  end

  # returning the uri to be passed into the show_recipe thing
  def self.uri_from_id(id)
    "http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"
  end

  # this is to send in the parse
 # initialize(label, uri, url, image, ingredientLines, dietLabels)
  def self.create_recipe(api_params)
    #binding.pry
    return Recipe.new(
      api_params["label"],
      id_from_uri(api_params["uri"]),
      api_params["url"],
      api_params["image"],
      api_params["ingredientLines"],
      api_params["dietLabels"]
    )
  end


end
