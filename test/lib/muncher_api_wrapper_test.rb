require 'test_helper'

describe MuncherApiWrapper do
  it 'can search recipes' do
    VCR.use_cassette('recipes') do
        query = "chicken"
      recipes = MuncherApiWrapper.get_recipes(query)
      expect (recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :name
        expect(recipe).must_respond_to :uri
      end
    end
    # it "can show details of valid recipe" do
    #   VCR.use_cassette('recipe_id') do
    #     recipe_id =
    #     recipe = MuncherApiWrapper.get_recipe(recipe_id)
    #
    #   end
    
  end
end
