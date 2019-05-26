require 'test_helper'

describe EdamamApiWrapper do

  describe "search" do
    it "can get list of recipes for user search term" do
      VCR.use_cassette('recipes') do
        query = "Lemongrass"

        search_results = EdamamApiWrapper.search(query)

        expect(search_results).must_be_kind_of Array
        expect(search_results.first).must_respond_to :name
        expect(search_results.first.name).must_include query
      end
    end
  end

  describe "find details" do
    it "can get the details of a single recipe" do
      VCR.use_cassette("recipes") do
          query = "ginger"
          search_results = EdamamApiWrapper.search(query)

          found_recipe = EdamamApiWrapper.find_details(search_results.first.id)

          expect(found_recipe).must_be_instance_of Recipe
          # expect(search_results.first).must_equal found_recipe
          expect(found_recipe.id).must_equal search_results.first.id
      end
    end
  end


end
