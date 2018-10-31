require "test_helper"

# test paths here and flash notices
# only call VCR when using an API call, eg a home page

describe RecipesController do
  it "should get home" do
    # make test to
    get root_path
    value(response).must_be :successful?
  end

  it "should get find_recipe" do
    get find_recipe_path
    value(response).must_be :successful?
  end

  it "should handle find recipe w/ bogus data" do

  end

  it "should get list" do
    VCR.use_cassette('recipe') do
    get list_recipes_path

    value(response).must_be :successful?
    end

  end

end
