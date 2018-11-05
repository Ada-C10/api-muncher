require 'test_helper'

describe EdamamApiWrapper do

  describe "search" do
    it "returns correct number of recipes when a valid recipe word was entered" do
      VCR.use_cassette("recipes") do
        is_successful = EdamamApiWrapper.search("cookie")
        expect(is_successful.length).must_equal 50
      end
    end
    #
    # it "is successful when sending a message to a fake channel" do
    #   VCR.use_cassette("recipes") do
    #     is_successful = EdamamApiWrapper.send_message("this-channel-does-not-exist", "test message")
    #     expect(is_successful).must_equal true
    #   end
    # end

  end

  describe "show recipe" do
    it "" do

    end
  end

  describe "create recipe " do

  end

  describe "id from uri" do

  end

  describe "uri from id" do

  end
end
