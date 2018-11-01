require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('list_recipes') do
      recipes = EdamamApiWrapper.list_recipes("cheese")

      expect(recipes.length).must_be :>, 0

      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :id
      end
    end
  end

  it 'will return an empty array if no recipes are found' do
    VCR.use_cassette('list_recipes') do
      recipes = EdamamApiWrapper.list_recipes("")

      expect(recipes.length).must_equal 0
    end
  end

  it 'can create a recipe object given a valid id' do
    VCR.use_cassette('display_recipe') do
      recipe = EdamamApiWrapper.display_recipe('1ba32b41f9f507c048b50b1704b13b8f')

      expect(recipe).must_be_instance_of Recipe
    end
  end

  it 'cannot create a recipe object given an invalid id' do
    VCR.use_cassette('display_recipe') do
      recipe = EdamamApiWrapper.display_recipe('1ba32b41f9f507c048b50b1704b13b8e')

      expect(recipe).must_be_nil
    end
  end
end
