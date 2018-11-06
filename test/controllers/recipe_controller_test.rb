require "test_helper"

describe RecipeController do
  it "should get index" do
    VCR.use_cassette('search_file') do
      get recipes_path
       must_respond_with :success
    end
  end

  it "should get show for a recipe" do
    VCR.use_cassette('find_a_recipe_file') do
      get recipe_path("recipe_9dc29c44bc154e8aaa67f2cde17f6196")
      must_respond_with :success
    end
  end
end
