require 'test_helper'

describe Recipe do
  it "raises an error if both uri is not passed in" do
    expect {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "assigns a uri at initialization" do
    recipe = Recipe.new('some uri')
    expect(recipe.uri).wont_be_nil
    expect(recipe.uri).must_equal 'some uri'
  end

  it "raises an error if url is an empty string" do
    empty_string = ''

    expect {
      Recipe.new(empty_string)
    }.must_raise ArgumentError
  end

  it "properly sets non-initialized parameters" do
    my_recipe = Recipe.new('url', 'pie', 2, 'jpeg', [], [], [], 4)

    expect(my_recipe.image).must_equal 'jpeg'
    expect(my_recipe.serving).must_equal 2
    expect(my_recipe.dietLabels).must_equal []
    expect(my_recipe.ingredients).must_equal []
    expect(my_recipe.calories).must_equal 4
  end
end
