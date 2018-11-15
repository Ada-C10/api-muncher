require "test_helper"

describe RecipesController do
  describe "index" do
    it "can get a list of recipes when given valid input" do
      VCR.use_cassette('list_recipes') do
        get recipes_path, params: { query: "cheese" }

        must_respond_with :success
      end
    end

    it "can get a list of recipes even when given invalid input" do
      VCR.use_cassette('list_recipes') do
        get recipes_path, params: { query: nil }

        must_respond_with :success
        expect(flash.now[:message]).must_equal "Could not find any recipes for '#{nil}'. Here are some yummy ones instead!"
      end
    end
  end

  describe "show" do
    it "can get the recipe details" do
      VCR.use_cassette('recipe_detail') do
        get recipe_path("1ba32b41f9f507c048b50b1704b13b8f")

        must_respond_with :success
      end
    end

    it "redirects when given a bogus id" do
      VCR.use_cassette('recipe_detail') do
        get recipe_path("1ba32b41f9f507c048b50b1704b13b8e")

        must_respond_with :success
        expect(flash.now[:message]).must_equal "Recipe not found. Try another search!"
      end
    end
  end
end
