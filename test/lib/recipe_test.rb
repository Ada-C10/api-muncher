require 'test_helper'

describe Recipe do

  it 'raises an error if link is nil' do
    expect {
      Recipe.new("name")
    }.must_raise ArgumentError
  end

  it 'raises an error if link is an empty string ""' do
    expect {
      Recipe.new("name", "")
    }.must_raise ArgumentError
  end

  it 'assigns a name, link, source, image, ingredients, dietary_info, and recipe_source at initialization' do
    recipe = Recipe.new(
      "Nom de Plume",
      "http",
      "source",
      "image",
      "ingredients array",
      "dietary info",
      "recipe source"
    )

    expect(recipe.name).wont_be_nil
    expect(recipe.name).must_equal 'Nom de Plume'

    expect(recipe.link).wont_be_nil
    expect(recipe.link).must_equal 'http'

    expect(recipe.source).wont_be_nil
    expect(recipe.source).must_equal 'source'

    expect(recipe.image).wont_be_nil
    expect(recipe.image).must_equal 'image'

    expect(recipe.ingredients).wont_be_nil
    expect(recipe.ingredients).must_equal 'ingredients array'

    expect(recipe.dietary_info).wont_be_nil
    expect(recipe.dietary_info).must_equal 'dietary info'

    expect(recipe.recipe_source).wont_be_nil
    expect(recipe.recipe_source).must_equal 'recipe source'

  end

end
