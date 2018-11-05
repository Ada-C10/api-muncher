require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  describe "search" do

    it "can get search page" do
      get root_path
      must_respond_with :success
    end

    it "can do a recipe search" do
      VCR.use_cassette("search_recipes") do
        get recipes_path, params: {query: "tacos"}

        must_respond_with :ok
      end
    end

    it "can get next page of recipes" do
      VCR.use_cassette("search_next_recipes") do
        get recipes_path, params: {query: "tacos", from: 10}

        must_respond_with :ok
      end
    end

    it "can get a single recipe" do
      VCR.use_cassette("get_single_recipe") do
        recipe = {
          :uri => "http://www.edamam.com/ontologies/edamam.owl#recipe_6245fdcbb8c11fc1784df27c4d3426c5"
        }

        get recipe_path(recipe: recipe[:uri])

        must_respond_with :ok
      end
    end
  end
end
