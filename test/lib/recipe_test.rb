require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 2 parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new "Label"
    }.must_raise ArgumentError
  end

  it "Must initialize lable & uri properly" do
    recipe = Recipe.new("label", "uri")
    expect(recipe.label).must_equal "label"
    expect(recipe.uri).must_equal "uri"
  end
end
