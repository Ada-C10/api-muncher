require "test_helper"

describe RecipesController do
  it "should get index" do
    VCR.use_cassette('search_list') do

      get recipes_index_path

      must_respond_with :ok
    end
  end

  it "should get show" do
    get recipes_show_url
    value(response).must_be :success?
  end

end
