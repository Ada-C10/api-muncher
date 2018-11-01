class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search"
  ID = ENV["EDAMAM_ID"]
  KEY = ENV["EDAMAM_KEY"]

  def self.recipe_search(keyword)

    url = BASE_URL + "?q=#{keyword}" + "&app_id=#{ID}" + "&app_key=#{KEY}" + "&to=100"  #search results max out at 100
    data = HTTParty.get(url)
    recipe_list = []

    if data && data["hits"] && data["hits"].any?
      data["hits"].each do |hit|
        label = hit["recipe"]["label"]
        image = hit["recipe"]["image"]
        uri = hit["recipe"]["uri"]

        recipe_list << create_recipe({label: label, image: image, uri: uri})

      end
    else
      return []
    end
    return recipe_list
  end

  def self.show_recipe(id)
    uri_start = "?r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_"
    url = BASE_URL + uri_start + "#{id}" + "&app_id=#{ID}" + "&app_key=#{KEY}"
    data = HTTParty.get(url)

    if data.any?
      label = data[0]["label"]
      image = data[0]["image"]
      uri = data[0]["uri"]
      rec_url = data[0]["url"]
      ingredientLines = data[0]["ingredientLines"]  # this is an array
      healthLabels = data[0]["healthLabels"] # this is an array

      recipe = create_recipe({label: label, image: image, uri: uri, url: rec_url, ingredientLines: ingredientLines, healthLabels: healthLabels})

      return recipe

    else
      return nil
    end

  end


  private

    def self.create_recipe(api_params)
      return Recipe.new(
        api_params[:label],
        api_params[:image],
        api_params[:uri],
        {
          url: [:url],
          ingredientLines: [:ingredientLines],
          healthLabels: [:healthLabels]
        }
      )
    end



end
