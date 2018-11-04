require 'test_helper'

describe Recipe do

  it "initializes a recipe given uri" do
    recipe = Recipe.new(uri: "uri test", name: "test")
    expect(recipe.uri).must_equal "uri test"
    expect(recipe.name).must_equal "test"
  end


end
