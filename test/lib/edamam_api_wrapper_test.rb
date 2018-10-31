require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('list_recipes') do
      recipes = EdamamApiWrapper.list_recipes('chicken')

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :uri
        expect(recipe).must_respond_to :image
      end
    end
  end

  it 'can find a recipe with a valid id' do
    VCR.use_cassette('find_recipe') do
      recipe = EdamamApiWrapper.find_recipe('recipe_7bf4a371c6884d809682a72808da7dc2')

      expect(recipe).wont_be_nil
    end
  end

end
