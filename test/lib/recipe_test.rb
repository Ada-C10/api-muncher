require 'test_helper'

describe Recipe do
  it "raises an error if both uri and label are not passed in" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new('Apple Pie')
  }.must_raise ArgumentError
  end

  it "assigns a uri and label at initialization" do
    recipe = Recipe.new('some uri', 'some label')
    expect(recipe.uri).wont_be_nil
    expect(recipe.uri).must_equal 'some uri'

    expect(recipe.label).wont_be_nil
    expect(recipe.label).must_equal 'some label'
  end

  it "raises an error if url or label are empty strings" do

    empty_string = ''
    valid_input = 'Apple pie'

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
