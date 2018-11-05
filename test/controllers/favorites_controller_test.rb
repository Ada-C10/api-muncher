require "test_helper"

describe FavoritesController do
  it "should get index" do
    get favorites_index_url
    value(response).must_be :success?
  end

  it "should get create" do
    get favorites_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get favorites_destroy_url
    value(response).must_be :success?
  end

end
