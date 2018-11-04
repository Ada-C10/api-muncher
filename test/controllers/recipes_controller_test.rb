require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "can get the home path" do
      VCR.use_cassette('list_recipes_file') do
        get root_path

        must_respond_with :ok
      end
    end

    it "can get the index path" do
      get recipes_path
      must_respond_with :ok
    end

    it "can get the show patch" do
      VCR.use_cassette('recipe_detail') do
        get recipe_create_path("uri"), params: { message: 'Happy Halloween' }

        must_redirect_to root_path
      end
    end





end
