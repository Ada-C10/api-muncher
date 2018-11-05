require 'test_helper'

describe Recipe do

  it "cannot be initialized with less than 2 parameters" do
    expect{
      Recipe.new
    }.must_raise ArgumentError


    expect {
      Recipe.new("Label")
    }.must_raise ArgumentError
  end

  it "must be initialized with a label and uri" do

    recipe = Recipe.new("label", "uri")

    expect(recipe.label).wont_be_nil
    expect(recipe.label).must_equal "label"

    expect(recipe.uri).wont_be_nil
    expect(recipe.uri).must_equal "uri"
  end
  

  it "raises an error if label or uri are empty" do

    empty_string = ""
    valid_string = "test"

    expect {
      Recipe.new(empty_string, valid_string)
    }.must_raise ArgumentError

    expect {
      Recipe.new(valid_string, empty_string)
    }.must_raise ArgumentError

  end

end
