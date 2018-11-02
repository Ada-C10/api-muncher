require "test_helper"

describe Recipe do
  it "will create a new recipe when given valid data" do

    recipe = Recipe.new("BBQ Chicken", { source: "Mr Chef", yield: 6})
    expect(recipe).must_be_kind_of Recipe
  end

  it "will create a new recipe if only given a title" do
    recipe = Recipe.new("BBQ Chicken")
    expect(recipe).must_be_kind_of Recipe
  end

  it "will raise an ArgumentError if given no title" do

    expect{Recipe.new}.must_raise ArgumentError
  end
end
