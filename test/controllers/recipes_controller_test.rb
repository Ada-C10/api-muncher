require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "can get the home path" do
      VCR.use_cassette('list_recipes_file') do
        render  layout:  "home_o"

        must_respond_with :ok
      end
    end

    it "can get the index path" do
      get recipes_path
      must_respond_with :ok
    end

    it "can get the show patch" do
      VCR.use_cassette('recipe_detail') do

        expect(get recipe_path("uri"), params: { uri: '5ef38059cac69b777bc917b8c84bb79b' }).must_be_instance_of Recipe

        must_respond_with :ok

      end
    end

end
