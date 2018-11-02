require "test_helper"

describe RecipesController do
  it "should get index" do
    VCR.use_cassette('list_recipes') do
      get recipes_path
      
      must_respond_with :ok
    end
  end

  it "should get show for valid id" do
    VCR.use_cassette('show_recipe') do
      get recipe_path("d87818beb641e9da9e122fb8cf69ab50")

      must_respond_with :ok
    end
  end

  it "responds with not_found for invalid ID" do
    VCR.use_cassette('show_recipe') do
      get recipe_path(-1)

      must_respond_with :not_found
    end
  end
end
