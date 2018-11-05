require 'test_helper'

describe EdamamApiWrapper do

  it "can do a recipe search" do
    VCR.use_cassette("search_recipes") do
      params = {
        :query => "tacos",
        :from => 0,
      }
      recipes = EdamamApiWrapper.search_recipes(params)

      expect(recipes).must_be_kind_of Hash
    end
  end

  it "can parse api response" do
    VCR.use_cassette("search_recipes") do
      params = {
        :query => "tacos",
        :from => 0,
      }
      recipes = EdamamApiWrapper.search_recipes(params)
      recipes = EdamamApiWrapper.parse_api_response(recipes)

      expect(recipes[:recipes]).must_be_kind_of Array
      expect(recipes[:recipes].length).must_be :>, 0
    end
  end

  it "can get a single recipe" do
    VCR.use_cassette("get_single_recipe") do
      recipe = {
        :uri => "http://www.edamam.com/ontologies/edamam.owl#recipe_6245fdcbb8c11fc1784df27c4d3426c5"
      }

      recipe = EdamamApiWrapper.get_recipe(recipe[:uri])

      expect(recipe).must_be_kind_of Array
    end
  end

  it "can parse a single recipe" do
    VCR.use_cassette("get_single_recipe") do
      recipe = {
        :uri => "http://www.edamam.com/ontologies/edamam.owl#recipe_6245fdcbb8c11fc1784df27c4d3426c5"
      }

      recipe = EdamamApiWrapper.get_recipe(recipe[:uri])
      recipe = EdamamApiWrapper.parse_recipe(recipe)

      expect(recipe).must_be_kind_of Hash
    end
  end
end
