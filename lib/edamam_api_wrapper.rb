require 'cgi/escape'
require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  APP_KEY = ENV["MUNCHER_TOKEN"]
  APP_ID = ENV["MUNCHER_ID"]
  API_URL = "#{BASE_URL}?app_id=#{APP_ID}&app_key=#{APP_KEY}"

  #
  def self.search_recipes(params)
    query = params[:query]
    from = params[:from]

    url = "#{API_URL}&q=#{query}&from=#{from}"
    data = self.do_query(url)

    return data
  end

  def self.get_recipe(recipe)
    recipe = CGI::escape(recipe)
    url = "#{API_URL}&r=#{recipe}"
    data = self.do_query(url)

    return data
  end

  def self.parse_api_response(response)
    data = {}
    data[:next_from] = response['to']
    data[:prev_from] = response['from'] - (response['to'] - response['from'])
    data[:more_results] = response['more']
    data[:recipes] = response['hits']

    return data
  end

  def self.parse_recipe(recipe)
    recipe = recipe[0] if recipe.is_a?(Array)
    parsed_recipe = {}

    parsed_recipe[:name] = recipe['label']
    parsed_recipe[:image_url] = recipe['image']
    parsed_recipe[:uri] = recipe['uri']
    parsed_recipe[:source] = recipe['source']
    parsed_recipe[:ingredients] = recipe['ingredientLines']
    parsed_recipe[:url] = recipe['url']
    parsed_recipe[:diets] = recipe['dietLabels']


    return parsed_recipe
  end

  private

  def self.do_query(url)
    response = HTTParty.get(url)
    data = response.parsed_response
  end
end
