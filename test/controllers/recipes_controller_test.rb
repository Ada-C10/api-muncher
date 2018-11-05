require "test_helper"

describe RecipesController do
  describe 'index' do
    it "can get the index path" do
      VCR.use_cassette('list_recipes_file') do
        get recipes_path(search: "fish")

        must_respond_with :ok
      end
    end

    it "can will redirect the root path with invalid parameter" do
      VCR.use_cassette('list_recipes_file') do
        get recipes_path

        must_redirect_to root_path
      end
    end
  end


  describe 'show' do
    it "can show a recipe" do
      VCR.use_cassette('get_recipe_file') do
        get recipe_path("7dae816aa7c847f2842be8e1360ddd60")
        must_respond_with :ok
      end
    end

    it "will redirect to root page if an invalid request was sent" do
      VCR.use_cassette('get_recipe_file') do
        get recipe_path("boo")
        must_respond_with :bad_request
      end
    end
  end

end
