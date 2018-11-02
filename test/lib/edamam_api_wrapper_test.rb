require 'test_helper'

describe EdamamApiWrapper do

  describe "EdamamApiWrapper#self.search_recipes(food)" do

    it "returns a list of recipes" do
      VCR.use_cassette("recipes") do
        food = "test food"
        response = EdamamApiWrapper.search_recipes(food)

        expect(response.length).wont_be_nil
      end
    end

    it "can't return a list of recipes with invalid food type" do
      VCR.use_cassette("bad_recipes") do
        response = EdamamApiWrapper.search_recipes(food)
    
        response.must_be_empty
      end
    end

  end

  # describe "EdamamApiWrapper#self.create_recipe(api_params)" do
  #   it "creates and returns instance of Recipe" do
  #
  #   end
  #
  #   it "can't create instace of Recipe given invalid parameters" do
  #   end
  # end
  #
  # describe "EdamamApiWrapper#self.find_recipe(uri)" do
  #   it "returns an instace a recipe when given the uri" do
  #   end
  #
  #   it "can't return a recipe given an invalid uri" do
  #   end
  # end

end
