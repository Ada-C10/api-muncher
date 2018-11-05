require 'httparty'
require 'will_paginate/array'

class EdamamApiWrapper
  TOKEN_ID = ENV["APPLICATION_ID"]
  TOKEN_KEY = ENV["APPLICATION_KEYS"]
  BASE_URL = "https://api.edamam.com/search"
  QUERY_URL = "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&to=100&q="
  # FIND_URL1 = "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&r="
  FIND_URL = "?app_id=#{TOKEN_ID}&app_key=#{TOKEN_KEY}&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_"



  def self.list_recipes(search)
    # create url with search
    url = BASE_URL + "#{QUERY_URL}" + "#{search}"
    recipes = HTTParty.get(url)

    recipe_list = []
    if recipes["hits"]
      recipes["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data)
      end
    end

    return recipe_list
  end

  def self.find_recipe(find)
    url = BASE_URL + FIND_URL + "#{find}"
    encoded_url = URI.encode(url)
    recipe = HTTParty.get(url)
    if recipe[0]
      found = show_recipe(recipe[0])
    else
      found = nil
    end

    return found
  end

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
    else
      paginate(page: page, per_page: 10).order('id DESC')

    end
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
        api_params["recipe"]["uri"].split('_')[1],
        api_params["recipe"]["label"],
        api_params["recipe"]["image"],
        api_params["recipe"]["source"],
        api_params["recipe"]["url"],
        api_params["ingredientLines"],
        api_params["healthLabels"],
        api_params["cautions"]
    )
  end


  def self.show_recipe(api_params)
    return Recipe.new(
        api_params["uri"].split('_')[1],
        api_params["label"],
        api_params["image"],
        api_params["source"],
        api_params["url"],
        api_params["ingredientLines"],
        api_params["healthLabels"],
        api_params["cautions"]
        )
  end
end
