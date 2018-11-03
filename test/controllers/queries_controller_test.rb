require "test_helper"

describe QueriesController do
  it "should get create" do
    get queries_create_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get queries_destroy_url
    value(response).must_be :success?
  end

end
