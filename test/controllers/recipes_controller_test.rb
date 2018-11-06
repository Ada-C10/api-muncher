require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "can get the index path" do
    VCR.use_cassette('recipes')
    get root_path
    must_respond_with :ok
  end

  it "can get the search form" do
    get search_recipes
    must_respond_with :ok
  end

  it "can get the recipe show" do
    get recipe_show
    must_respond_with :ok
  end

end
