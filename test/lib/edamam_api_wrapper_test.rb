require 'test_helper'

describe EdamamApiWrapper do

  describe "send message" do

    it "returns true when a valid channel and message were successful" do
      VCR.use_cassette("recipes") do
        message = "How many times does this actually send to the internet?"
        is_successful = EdamamApiWrapper.send_message("edges-api-testing", message)
        expect(is_successful).must_equal true
      end
    end

    it "is successful when sending a message to a fake channel" do
      VCR.use_cassette("recipes") do
        is_successful = EdamamApiWrapper.send_message("this-channel-does-not-exist", "test message")
        expect(is_successful).must_equal true
      end
    end

  end

end
