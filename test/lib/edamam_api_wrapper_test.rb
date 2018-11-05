require 'test_helper'


describe EdamamApiWrapper do

  describe "send message" do

    it "Must be an instance of class Recipe when the search method is called" do
      VCR.use_cassette("recipes") do
        message = "This app is making me hungry"
        is_successful = EdamamApiWrapper.search_recipes("cake")
        expect(is_successful[0].class).must_equal Recipe
      end
    end



  end

end
