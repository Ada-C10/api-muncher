require "test_helper"

describe FavoritesController do
  it "should get index" do
    get favorites_path
    value(response).must_be :success?
  end

  it "should get create" do
    post favorites_path
    value(response).must_be :success?
  end

  it "should get destroy" do
    id = 1
    delete favorite_path(id)
    value(response).must_be :success?
  end

  it "should get clear" do
    delete clear_favorites_path
    value(response).must_be :success?
  end

end
