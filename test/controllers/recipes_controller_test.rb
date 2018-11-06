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
      VCR.use_cassette('index') do
        get recipes_path
        must_respond_with :ok
      end
    end

    it "render a flash message when search result is nil" do
      title_hash = {
       title: {
       title: nil
       }
      }

      VCR.use_cassette('index') do
        get recipes_path, params:title_hash

        must_respond_with :ok
        expect(flash.now[:result_text]).must_equal "No result found, modify the search keyword and try again. "
      end
    end

    it "can get the show patch" do
      VCR.use_cassette('recipe_detail') do
        get recipe_path("uri"), params: { uri: '5ef38059cac69b777bc917b8c84bb79b' }
        must_respond_with :ok
      end
    end

end
