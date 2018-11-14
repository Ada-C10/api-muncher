require 'test_helper'

describe Recipe do

  it "initializes a recipe given uri" do
    recipe = Recipe.new(uri: "7bf4a371c6884d809682a72808da7dc2", name: "David Lebovitz")
    expect(recipe.uri).must_equal "7bf4a371c6884d809682a72808da7dc2"
    expect(recipe.name).must_equal "David Lebovitz"
  end

end
