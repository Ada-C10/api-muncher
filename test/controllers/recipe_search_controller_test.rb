require "test_helper"

describe RecipeSearchController do
  it "should get search" do
    get recipe_search_search_url
    value(response).must_be :success?
  end

  it "should get index" do
    get recipe_search_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get recipe_search_show_url
    value(response).must_be :success?
  end

end
