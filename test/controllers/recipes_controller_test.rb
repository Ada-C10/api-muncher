require "test_helper"

describe RecipesController do

  #should I test for home or root?

  it "can get the root/home path" do
    VCR.use_cassette('show_rootpage_file') do

      get root_path

      must_respond_with :ok
    end
  end

  it "can get the index path " do
    VCR.use_cassette('list_recipes_file') do

      get search_path

      must_respond_with :ok
    end
  end

  it "can get the show path with valid uri" do
    VCR.use_cassette('show_recipe_file') do

      uri = "7543ecfa28b7506a97360748f017a83e"

      get recipe_path(uri)

      must_respond_with :ok
    end
  end

  it "cannot get the show path with invalid uri" do
    VCR.use_cassette('show_recipe_file') do

      uri = "bogus7a83e"

      get recipe_path(uri)

      must_respond_with :bad_request
    end
  end

end
