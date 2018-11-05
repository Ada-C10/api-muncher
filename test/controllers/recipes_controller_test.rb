require "test_helper"

describe RecipesController do

  it "can get the root path" do
    VCR.use_cassette('recipes') do
      get root_path
      must_respond_with :ok
    end

  end

it "can get the index path" do
  VCR.use_cassette('recipes') do
    get recipes_path
    must_respond_with :ok
  end

end

it "can get and show recipe " do
  VCR.use_cassette('recipe') do
    get recipe_path('recipe'), params: { uri: "test uri" }
    must_respond_with :ok
  end

end

end
