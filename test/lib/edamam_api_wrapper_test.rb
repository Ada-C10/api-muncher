require 'test_helper'

describe EdamamApiWrapper do

  describe "find recipe" do

    RECIPE_URI = "recipe_8cb51d70083e7f9d44cc1d9f2bebc738"

    it "returns a recipe when given a valid uri" do
      VCR.use_cassette("recipe") do
        is_successful = EdamamApiWrapper.find_recipe(RECIPE_URI)
        expect(is_successful).must_be_instance_of Recipe
      end
    end

    it "is successful when no recipe exists" do
      VCR.use_cassette("recipe") do
        response = EdamamApiWrapper.find_recipe("this_recipe_does_not_exist")
        response.wont_be_nil
      end
    end

  end

  describe "search recipes" do

    it "returns an array of recipes if successful" do
      RECIPES_SEARCH_TERM = "Taco"
      VCR.use_cassette("recipes") do
        is_successful = EdamamApiWrapper.search_recipes(RECIPES_SEARCH_TERM)
        expect(is_successful).must_be_instance_of Array
        is_successful.each do |recipe|
          expect(recipe).must_be_instance_of Recipe
        end
      end
    end

    it "is successful when no recipe exists" do
      VCR.use_cassette("recipes") do
        response = EdamamApiWrapper.search_recipes("this_recipe_does_not_exist")
        response.wont_be_nil
      end
    end

  end

end
