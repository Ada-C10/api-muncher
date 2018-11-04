require 'test_helper'

describe Recipe do

  it 'requires at least one parameter to be passed in' do
    expect{
      Recipe.new
    }.must_raise ArgumentError
  end

  it 'assigns a label at initialization' do
    recipe = Recipe.new("chicken")
    expect(recipe.label).must_equal "chicken"
  end

  it 'responds to all attribute methods' do
    recipe_attrs = %i[diet_labels image ingredients label source uri]
    recipe = Recipe.new("chicken")
    recipe_attrs.each do |recipe_attr|
      
      expect(recipe).must_respond_to recipe_attr
    end
  end

end
