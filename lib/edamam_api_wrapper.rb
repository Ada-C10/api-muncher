require 'httparty'

class EdamamApiWrapper
  BASE_URL = 'https://api.edamam.com/search?'
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]

  def self.search(q)
    url = BASE_URL + "q=#{q}" + "&app_id=#{ID}" + "&app_key=#{KEY}"

    encoded_url = URI.encode(url)
    response = HTTParty.get(encoded_url)

    recipes_list = []

    if response["hits"]
      response["hits"].each do |hit_data|
        recipes_list << create_recipe(hit_data["recipe"])
      end
    end

    return recipes_list
  end


  def self.show_recipe(id)

    new_url = CGI.escape(uri_from_id(id))
    url = BASE_URL + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&r=#{new_url}"

    data = HTTParty.get(url)
    # response = HTTParty.get(url)

    # h = data[0]
    return create_recipe(data[0])

  end


  def self.id_from_uri(uri)
    uri.match(/#recipe_(.*)$/)[-1]
  end

  def self.uri_from_id(id)
    "http://www.edamam.com/ontologies/edamam.owl#recipe_" + "#{id}"
  end


  def self.create_recipe(api_params)
    return Recipe.new(
      id_from_uri(api_params["uri"]),
      api_params["label"],
      api_params["url"],
      api_params["image"],
      api_params["ingredientLines"],
      api_params["dietLabels"]
    )
  end

end
