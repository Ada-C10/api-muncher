require 'test_helper'

describe RecipeApiWrapper do
  describe "recipe list" do
    it "returns a list of recipes when given a food search choice" do
      VCR.use_cassette("recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("chicken")
        expect(recipe_list).must_be_kind_of Array
        expect(recipe_list.count).must_equal 10
      end
    end

    it "returns no recipes when no food choice is given" do
      VCR.use_cassette("no_recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("")
        expect(recipe_list).must_be_kind_of Array
        expect(recipe_list.count).must_equal 0
      end
    end

    it "returns no recipes when an food choice is an invalid entry/not found" do
      VCR.use_cassette("invalid_recipes") do
        recipe_list = RecipeApiWrapper.list_recipes("x999")
        expect(recipe_list).must_be_kind_of Array
        expect(recipe_list.count).must_equal 0
      end
    end
  end
end
