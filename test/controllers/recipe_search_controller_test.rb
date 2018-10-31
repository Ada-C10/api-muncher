require "test_helper"

describe RecipeSearchController do
  it "should get search" do
    get root_path
    must_respond_with :success
  end

  it "should get index" do
    VCR.use_cassette('list_recipes_file') do
      get recipe_searches_path
      must_respond_with :success
    end
  end

  it "should get show with valid ID" do
    fragment = "recipe_3d81878cd040aa6a73a2c3f11293102a"
    get recipe_path(fragment)
    must_respond_with :success
  end

  it "should not get show with invalid ID" do
    fragment = "invalid"
    get recipe_path(fragment)
    must_respond_with :not_found
  end

end
