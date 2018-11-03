require 'test_helper'

describe Recipe do

  it "raises an error if label and uri are not passed in" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new("foo")
    }.must_raise ArgumentError
  end

  it "assigns a label and an uri at initialization" do
    recipe = Recipe.new('Green Beans', 'http://www.123', 'url', 'image', 'ingredientLines', 'dietLabels')

    expect(recipe.label).wont_be_nil
    expect(recipe.label).must_equal 'Green Beans'

    expect(recipe.id).wont_be_nil
    expect(recipe.id).must_equal 'http://www.123'

  end

  it "raises an error if name or id are empty strings" do

    empty_string = ''
    valid_input = 1

    expect {
      Recipe.new(empty_string, valid_input,'url', 'image', 'ingredientLines', 'dietLabels' )
    }.must_raise ArgumentError

    expect {
      Recipe.new(valid_input, empty_string, 'url', 'image', 'ingredientLines', 'dietLabels')
    }.must_raise ArgumentError

    expect {
      Recipe.new(empty_string, empty_string, 'url', 'image', 'ingredientLines', 'dietLabels')
    }.must_raise ArgumentError

  end

end
