#https://api.edamam.com/search?app_id=cbb60eec&app_key=4e66a33b50ad72982bec83800f09869c&q=chicken

require 'httparty'
require 'pry'

class EdamamApiWrapper
  # Your code here!
  BASE_URL = "https://api.edamam.com/"
  ID = ENV["APP_ID"]
  KEY = ENV["APP_KEY"]


  def self.list_recipes(ingredients)
    url = BASE_URL + "search?" + "app_id=#{ID}" + "&app_key=#{KEY}"

    data = HTTParty.post(url,
      body:  {
        "q" => "#{ingredients}",
      },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })

    recipe_list = []

    if data["hits"]
      data["hits"].each do |recipe_data|
        recipe_list << create_recipe(recipe_data["recipe"])
      end
    end
    puts recipe_list
    return recipe_list
  end

  def self.find_recipe(recipe_id)

    url = BASE_URL + "search?" + "app_id=#{ID}" + "&app_key=#{KEY}" + "&r=http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_#{recipe_id}"

    data = HTTParty.get(url)
    
    return create_recipe(data[0])
  end


  def self.send_msg(channel, msg)
    puts "Sending message to channel #{channel}: #{msg}"

    url = BASE_URL + "chat.postMessage?" + "token=#{TOKEN}"
    response = HTTParty.post(url,
      body:  {
        "text" => "#{msg}",
        "channel" => "#{channel}",
        "username" => "Roberts-Robit",
        "icon_emoji" => ":robot_face:",
        "as_user" => "false"
      },
      :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
      #headers are important for encoding how the data is coming in
    return response.success?
  end

  private

  def self.create_recipe(api_params)

      return Recipe.new(
        api_params["label"],
        api_params["uri"],
        {
          image: api_params["image"],
          url: api_params["url"],
          ingredients: api_params["ingredientLines"],
          health: api_params["healthLabels"]
        }
      )
  end
end
