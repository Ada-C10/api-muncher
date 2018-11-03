require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('list_recipes_file') do
      recipes = EdamamApiWrapper.list_recipes("chicken")

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :uri
      end
    end
  end

  it 'can find one recipe' do
    VCR.use_cassette('recipe_file') do
      recipe = EdamamApiWrapper.single_recipe("d4c5f84bb24731bda2055195620a799c")
      expect(recipe).must_be_kind_of Recipe
      expect(recipe).must_respond_to :label
      expect(recipe).must_respond_to :uri
    end
  end

  it 'can return an empty array if no recipe is found' do
    VCR.use_cassette('recipe_file') do
      recipe = EdamamApiWrapper.single_recipe("test")
      expect(recipe).must_be_kind_of Array
    end
  end
end
