require "test_helper"

describe RecipesController do

  let (:params) {
    {
      query: "chicken",
      uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
    }
  }

  describe "search" do
    it "can get search page" do
      get root_path

      must_respond_with :success
    end
  end

  describe "results" do
    it "can get results page" do

      VCR.use_cassette("recipes") do

        get recipe_results_path, params: params

        must_respond_with :success

      end

    end
  end

  describe "show" do
    it "can get show page for a valid recipe uri" do
      VCR.use_cassette("recipe") do

        get recipe_path('chicken'), params: params

        must_respond_with :success

      end
    end

  end
end
