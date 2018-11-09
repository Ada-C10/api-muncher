require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 3 parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new "Label"
    }.must_raise ArgumentError

    new_recipe = Recipe.new("New Recipe", "Some ID", "Some Image")
    expect(new_recipe).must_be_kind_of Recipe
  end

  it "Must initialize all parameter properly" do
    recipe = Recipe.new("label", "ID", "image", "ingredients", "health_labels", "url", "recipe_source")
    # binding.pry
    expect(recipe.label).must_equal "label"
    expect(recipe.id).must_equal "ID"
    expect(recipe.image).must_equal "image"
    expect(recipe.ingredients).must_equal "ingredients"
    expect(recipe.health_labels).must_equal "health_labels"
    expect(recipe.url).must_equal "url"
    expect(recipe.recipe_source).must_equal "recipe_source"
  end

  it "raises an error if label, uri or image are empty strings or nil" do

    label = ''
    uri = nil
    image = ''

    expect {
      Recipe.new(label, uri, image)
    }.must_raise ArgumentError

  end
end
