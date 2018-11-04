require 'test_helper'

describe ApiMuncherWrapper do

  describe "recipes by ingredient" do

    it "returns an array with the API responses" do


      VCR.use_cassette("string") do
        ingredient = "broccoli"
        response = ApiMuncherWrapper.recipes_by_ingredient(ingredient)
        response["ok"].must_equal true
        response["message"]["text"].must_equal message
      end
      #
      # response = #something
      #
      # expect(response).must_equal true


    end

  end

end
