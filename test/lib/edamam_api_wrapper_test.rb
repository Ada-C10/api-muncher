require 'test_helper'

describe "Edamam Api Wrapper" do
  it "Can return a list of recipes with a valid input" do
    # Test EdamamApiWrapper.list_recipes here
    VCR.use_cassette("recipes") do
      response = EdamamApiWrapper.list_recipes("chicken")
      response["ok"].must_equal true
      response["search_terms"].must_equal "chicken"
    end
  end

  it "Returns an empty array when no results are returned" do
    VCR.use_cassette("invalid_search") do
      response = EdamamApiWrapper.list_recipes("gibberishtest")
      response["ok"].must_equal false
      response["error"].wont_be_nil
    end
  end

  it "Can return a recipe when given a valid uri" do
    # Test EdamamApiWrapper.get_recipe here
  end

end
