require 'test_helper'

describe "EdamamApiWrapper" do

  describe "search recipes" do

    it "returns list of recipes when query is successful" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        recipes = EdamamApiWrapper.search_recipes(query)

        expect(recipes).must_respond_to :each
        recipes.each do |recipe|
          expect(recipe).must_be_instance_of Recipe
        end

      end
    end

    it "returns empty list when query is unsuccessful" do
      VCR.use_cassette("recipes") do
        query = "foobar"
        recipes = EdamamApiWrapper.search_recipes(query)

        expect(recipes).must_equal []
      end
    end

  end



end
