require 'test_helper'

describe Recipe do
  it 'will raise an ArgumentError if created with less than 4 params' do
    expect {
      Recipe.new
    }.must_raise ArgumentError
  end

  it 'can be created with recipe uri, label, image, and source' do
    myRecipe = Recipe.new("sample_uri", "My Recipe", "sample_image", "sample_source")

    expect(myRecipe.uri).must_equal "sample_uri"
    expect(myRecipe.label).must_equal "My Recipe"
    expect(myRecipe.image).must_equal "sample_image"
    expect(myRecipe.source).must_equal "sample_source"
  end

  it 'can parse the recipe id' do
    myRecipe = Recipe.new("http:example#recipe_12345", "My Recipe", "sample_image", "sample_source")
    id = myRecipe.recipe_id

    expect(id).must_equal "recipe_12345"
  end
end
