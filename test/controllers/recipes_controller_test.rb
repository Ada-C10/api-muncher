require "test_helper"

describe RecipesController do

  describe 'index' do

    it "can get a list of recipes" do
      get recipes_path

      must_respond_with :ok
    end

    it "will return 'no results found' when search terms are invalid" do
      get recipes_path

    end
  end

  describe 'show' do

    it "can get a recipe's detail page" do
      get recipe_path("placeholder")

      must_respond_with :ok
    end

    it "will return not_found when invalid recipe id is provided" do
    end
  end
end
