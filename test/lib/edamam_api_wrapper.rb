require 'test_helper'

describe SlackApiWrapper do

  describe "find recipe" do
  RECIPE_URI = "recipe_8cb51d70083e7f9d44cc1d9f2bebc738"
    it "returns a recipe when given a valid uri" do
      VCR.use_cassette("recipe") do
        is_successful = EdamamApiWrapper.find_recipe(RECIPE_URI )
        expect(is_successful).must_equal true
      end
    end

    it "is successful when sending a message to a fake channel" do
      # VCR.use_cassette("channels") do
      #   is_successful = SlackApiWrapper.send_message("this-channel-does-not-exist", "test message")
      #   expect(is_successful).must_equal true
      # end
    end

  end
  #
  # describe "search recipes" do
  #
  #   it "returns true when a valid channel and message were successful" do
  #     VCR.use_cassette("channels") do
  #       message = "How many times does this actually send to the internet?"
  #       is_successful = SlackApiWrapper.send_message("edges-api-testing", message)
  #       expect(is_successful).must_equal true
  #     end
  #   end
  #
  #   it "is successful when sending a message to a fake channel" do
  #     VCR.use_cassette("channels") do
  #       is_successful = SlackApiWrapper.send_message("this-channel-does-not-exist", "test message")
  #       expect(is_successful).must_equal true
  #     end
  #   end
  #
  # end

end
