require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  it "can get the index path" do
    VCR.use_cassette('list_recipes_file') do

      get recipes_path

      must_respond_with :ok
    end
  end

  describe 'show' do
    it "can show a recipe" do
      VCR.use_cassette('get_recipe_file') do
        get recipe_path("7dae816aa7c847f2842be8e1360ddd60")
        must_respond_with :ok
      end
    end
    it "will redirect to the search page if an invalid request was sent" do
    end
  end

end
