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

end
end
