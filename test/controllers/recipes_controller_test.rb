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

  describe "show" do
    it "will display a recipe given a valid uri" do
      VCR.use_cassette("show_recipes") do
        get recipe_path, params: {uri: "http://www.edamam.com/ontologies/edamam.owl#23recipe_7bf4a371c6884d809682a72808da7dc2"}
        must_respond_with :success
      end
    end

    it "will return an error message when given an invalid uri" do
      VCR.use_cassette("none_recipes_contr") do
        get recipe_path, params: {uri: "http://www.edamam.com/ontologies/edamam.owl#23recipe"}
        must_respond_with :bad_request
      end
    end
  end
end
