require 'test_helper'

describe Recipe do
  it "will raise an ArgumentError if created with less than two params" do
    expect{
      Recipe.new}.must_raise ArgumentError

      expect{
        Recipe.new('Test')
      }.must_raise ArgumentError
  end

  it "can create a recipe with label and uri" do
    myRecipe = Recipe.new('Taco', 'recipe_3435454')
    expect(myRecipe.label).must_equal 'Taco'
    expect(myRecipe.uri).must_equal '3435454'
  end

  it "can create a recipe with optional params" do
    myRecipe = Recipe.new('Taco', 'recipe_3435454', {image:"image", url: "url",ingredients: "ingredients", health:"health"})
    expect(myRecipe.label).must_equal 'Taco'
    expect(myRecipe.uri).must_equal '3435454'
    expect(myRecipe.image).must_equal "image"
    expect(myRecipe.url).must_equal 'url'
    expect(myRecipe.ingredients).must_equal 'ingredients'
    expect(myRecipe.health).must_equal 'health'
  end
end
