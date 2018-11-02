require "test_helper"

describe RecipesController do

  it "should get show page for a single recipe" do
    VCR.use_cassette('single_recipe_file') do
      id = "9b5945e03f05acbf9d69625138385408"
      get recipes_path(id)
      value(response).must_be :successful?
    end
  end

  it "can get the index path that list all associted recipes" do
    VCR.use_cassette('list_recipe_file') do
      query = "chicken"
      get recipes_path(query)

      must_respond_with :ok
    end
  end

  # it "can get the index path that list all associted recipes" do
  #   VCR.use_cassette('empty_recipe_file') do
  #     query = nil
  #     get recipes_path(query)
  #
  #     must_redirect_to root_path
  #   end
  # end

  it "will redirect to new with empty query" do
    VCR.use_cassette('empty_query_file') do
      query = nil
      get recipes_path(query)

      must_respond_with :ok
    end
  end

  it "can get the new search form" do
    #this does not use the api because it gets it from the params
    get recipes_new_path

    must_respond_with :ok
  end


end
