require 'test_helper'

describe Recipe do

  it "raises an error if both name and id are not passed in" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new("foo")
    }.must_raise ArgumentError
  end

  it "assigns a food name and an ID at initialization" do
    recipe = Recipe.new('some id', 'cookie' )
    expect(recipe.name).wont_be_nil
    expect(recipe.name).must_equal 'cookie'

    expect(recipe.id).wont_be_nil
    expect(recipe.id).must_equal 'some id'
  end

  it "raises an error if name or id are empty strings" do

    empty_string = ''
    valid_input = 1

    expect {
      Recipe.new(empty_string, valid_input)
    }.must_raise ArgumentError

    expect {
      Recipe.new(valid_input, empty_string)
    }.must_raise ArgumentError

    expect {
      Recipe.new(empty_string, empty_string)
    }.must_raise ArgumentError

  end

end
