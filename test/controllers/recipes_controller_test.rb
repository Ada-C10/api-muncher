require "test_helper"

describe RecipesController do
  it "should get index" do
    VCR.use_cassette('list_recipes') do
      get recipes_path
      # value(response).must_be :success?
      must_respond_with :ok
    end
  end

  it "should get show" do
    VCR.use_cassette('show_recipe') do
      get recipe_path("d87818beb641e9da9e122fb8cf69ab50")

      must_respond_with :ok
    end
  end
end
