require 'httparty'

class EdamamApiWrapper

  BASE_URL = "https://slack.com/api/"
  EDAMAM_APP_ID = ENV['EDAMAM_APP_ID']
  EDAMAM_APP_KEY = ENV['EDAMAM_APP_KEY']

  def test
    return "test"
  end
end
