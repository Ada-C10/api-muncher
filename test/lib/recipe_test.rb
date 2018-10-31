require 'test_helper'

describe Recipe do
  it "cannot be initialized with less than 3 parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new("Label")
    }.must_raise ArgumentError

    expect {
      Recipe.new("Label", "Image")
    }.must_raise ArgumentError
  end

  it "must initialize name, id, and uri properly" do
    recipe = Recipe.new("Label", "Image", "URI")

    expect(recipe.label).must_equal "Label"
    expect(recipe.image).must_equal "Image"
    expect(recipe.uri).must_equal "URI"
  end
end
