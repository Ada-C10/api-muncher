require 'httparty'

class EdamamApiWrapper
  BASE_URL = "https://api.edamam.com/search?q="
  KEY = ENV["EDAMAM_KEY"]
  ID = ENV["EDAMAM_ID"]


  def self.list_channels
    # url = BASE_URL + "channels.list?" + "token=#{TOKEN}" + "&exclude_archived=1"
    # data = HTTParty.get(url)
    # channel_list = []
    #
    # if data["channels"]
    #   data["channels"].each do |channel_data|
    #     channel_list << create_channel(channel_data)
    #   end
    # end
    #
    # return channel_list
  end

  private

  def self.create_recipe(api_params)
    return Recipe.new(
      # api_params["name"],
      # api_params["id"],
      # {
      #   purpose: api_params["purpose"],
      #   is_archived: api_params["is_archived"],
      #   members: api_params["members"]
      # }
    )
  end

end
