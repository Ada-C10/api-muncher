require 'httparty'
require 'uri'

class EdamamApiWrapper
  BASE_URI = "https://api.edamam.com"
  EDAMAM_ID_PREFIX = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23"
  APP_ID = ENV["EDAMAM_APP_ID"]
  APP_KEY = ENV["EDAMAM_APP_KEY"]

  def self.param_helper(params)

  end

  def self.list_recipes(query, from: 0, to: 120, filters: {})
    uri = BASE_URI + "/search?q=#{query}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}" + "&from=#{from}" + "&to=#{to}"
    unless filters == {}
      filters.each do |key, values|
        values.each do |value|
          uri += "&#{key}=#{value}"
        end
      end
    end
    data = HTTParty.get(uri)
    recipe_list = []
    if data["hits"]
      data["hits"].each do |hit_data|
        recipe = build_recipe(hit_data["recipe"])
        if recipe.valid?
          recipe_list << recipe
        end
      end
    end
    return recipe_list
  end

  def self.get_recipe(uri)
    edamam_id = BASE_URI + "/search?r=#{EDAMAM_ID_PREFIX + uri}" + "&app_id=#{APP_ID}" + "&app_key=#{APP_KEY}"
    data = HTTParty.get(edamam_id)
    if data[0]
      return build_recipe(data[0])
    else
      return nil
    end
  end

  def self.list_tags(recipe_list, kind_of_tag)
    # Takes an array of recipes (recipe_list)
    # Takes a symbol that recipe must respond to (kind_of_tag)
    # Returns the set union of tags, removing all duplicates
    tags = []
    recipe_list.each do |recipe|
      tags = tags | recipe.send(kind_of_tag)
    end
    return tags
  end

  private

# Concentrate all the logic that relies on the specific Edamam API data
# in a single method here. (If the data in the API response changes,
# this will be the only method we need to update.)
  def self.build_recipe(api_params)
    args = Hash.new
      args[:label] = api_params["label"]
      args[:recipe_uri] = URI(api_params["uri"])
      args[:source] = api_params["source"]
      args[:source_uri] = api_params["url"]
      args[:ingredient_lines] = api_params["ingredientLines"]

    options = Hash.new
      options[:image_uri] = api_params["image"]
      options[:recipe_yield] = api_params["yield"]
      options[:total_time] = api_params["totalTime"]
      options[:health_labels] = api_params["healthLabels"]

    return Recipe.new(args, options)
  end

end

# Sample :recipe_uri
# http://www.edamam.com/ontologies/edamam.owl#recipe_3d81878cd040aa6a73a2c3f11293102a

# Sample Query:
# https://api.edamam.com/search?q=lemongrass&app_id=<ID>&app_key=<KEY>&from=0&to=3

# Sample Request:
# https://api.edamam.com/search?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_9b5945e03f05acbf9d69625138385408&app_id=<ID>&app_key=<KEY>

# Verify it works through the rails console:
# EdamamApiWrapper.list_recipes("bitter melon")
# EdamamApiWrapper.get_recipe("recipe_3d81878cd040aa6a73a2c3f11293102a")
