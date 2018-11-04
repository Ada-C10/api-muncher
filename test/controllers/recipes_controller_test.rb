require "test_helper"

describe RecipesController do
  describe 'index' do
    it 'shows a list of recipes' do
      VCR.use_cassette("list_channels_file") do
        get recipes_path

        must_respond_with :ok
      end
    end
  end


  it "can get the index path" do
    ingredients = {ingredients: "chocolate"}
    VCR.use_cassette('recipes') do
      get recipes_path, params: ingredients

      must_respond_with :ok
    end
  end
end 
