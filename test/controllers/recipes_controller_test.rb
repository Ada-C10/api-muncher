require "test_helper"

describe RecipesController do

  describe 'index' do

    it "can get a list of recipes" do
      VCR.use_cassette('list_recipes') do
        get recipes_path, params: { q: "chicken"}

        must_respond_with :ok
      end
    end

    it 'will flash warning if no search terms provided' do
      VCR.use_cassette('list_recipes') do
        get recipes_path, params: { q: nil }

        must_respond_with :ok
      end
    end

    it "will flash warning if search terms are invalid" do
      VCR.use_cassette('list_recipes') do
        get recipes_path, params: { q: -1 }

        must_respond_with :ok
      end
    end
  end

  describe 'show' do

    it "can get a recipe's detail page" do
      VCR.use_cassette('find_recipe') do
        get recipe_path("recipe_7bf4a371c6884d809682a72808da7dc2")
        must_respond_with :ok
      end
    end

    it "will return not_found when invalid recipe id is provided" do
      VCR.use_cassette('find_recipe') do
        get recipe_path(-1)
        must_respond_with :not_found
      end
    end
  end
end
