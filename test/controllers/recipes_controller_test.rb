require "test_helper"
require 'pry'

describe RecipesController do
  describe "index" do
    before do
      @valid_food_search = "chicken"
      @invalid_food_search = 9999
    end

    it "will return success when supplied a valid search term" do
      VCR.use_cassette("recipes_contr") do
        get recipe_list_path, params: {food_search: @valid_food_search}
        must_respond_with :success
      end
    end

    it "will return an error message when supplied an invalid search term" do
      VCR.use_cassette("invalid_recipes_contr") do
        get recipe_list_path, params: {food_search: @invalid_food_search}
        must_respond_with :bad_request
      end
    end

    it "will return an error message when supplied with no search term" do
      VCR.use_cassette("none_recipes_contr") do
        get recipe_list_path, params: {food_search: nil}
        must_respond_with :bad_request
      end
    end
  end
end
