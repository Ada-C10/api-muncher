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
    recipe = Recipe.new("Label", "Image", "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2")

    expect(recipe.label).must_equal "Label"
    expect(recipe.image).must_equal "Image"
    expect(recipe.id).must_equal "7bf4a371c6884d809682a72808da7dc2"
  end

  it "will initialize instance with the defaults if not given parameters for the keyword arguments" do
    recipe = Recipe.new("Label", "Image", "URI")

    expect(recipe.original_url).must_equal ""
    expect(recipe.ingredients).must_equal []
    expect(recipe.diet_labels).must_equal []
    expect(recipe.health_labels).must_equal []
    expect(recipe.source).must_equal ""
  end

  it "will initialize instance properly if given and if not given all keyword arguments" do
    recipe = Recipe.new("Label", "Image", "URI", original_url: "http://example.com", source: "Example")

    expect(recipe.original_url).must_equal "http://example.com"
    expect(recipe.ingredients).must_equal []
    expect(recipe.diet_labels).must_equal []
    expect(recipe.health_labels).must_equal []
    expect(recipe.source).must_equal "Example"
  end
end
