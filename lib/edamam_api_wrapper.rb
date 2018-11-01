require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV[APP_ID]
  KEY = ENV[APP_KEY]


  https://api.edamam.com/search?app_id=06a49133&app_key=3cf463de5ba73c4f32ecd937e555603c&q=banana
  def self.search_recipes(query)
    url = BASE_URL + "?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&q=#{query}"
    #if doesn't work - change & to be included in string before it

    data = HTTParty.get(url)

    search_list = []

    if data["hits"]
      data["hits"].each do |query_data|
        search_list << create_result_list(query_data)
      end
    end

    return search_list
  end

  private

  def self.create_result_list(api_params)
    return Recipe.new(
      api_params["label"],
      api_params["image"],
      api_params["url"],
      {
        ingredientLines: api_params["ingredientLines"],
        healthLabels: api_params["healthLabels"]
      }
    )
  end


end
