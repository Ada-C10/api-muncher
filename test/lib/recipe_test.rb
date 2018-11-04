require 'test_helper'

describe Recipe do

  it 'raises an error if recipe label is not passed in' do
    expect{
      Recipe.new
    }.must_raise ArgumentError
  end

  it 'assigns a label at initialization' do
    recipe = Recipe.new("chicken")
    expect(recipe.label).must_equal "chicken"
  end

  it 'raises an error if name is empty string or nil' do
    expect {
      Recipe.new("")
    }.must_raise ArgumentError

    expect {
      Recipe.new(nil)
    }.must_raise ArgumentError
  end

end
