require 'test_helper'


describe "Recipe" do

  it "raises an error if name, photo, and ingredients are not passed in" do

    expect{
      Recipe.new
    }.must_raise ArgumentError

    expect{
      Recipe.new('name')
    }.must_raise ArgumentError

    expect{
      Recipe.new('name', 'photo')
    }.must_raise ArgumentError

  end

  it "assigns a name, photo, uri, ingredients, and dietary information at initialization" do

    recipe = Recipe.new('name', 'photo', 'uri', {
      ingredients: ['ingredients'],
      dietary_information: ['dietary information']
      })

    expect(recipe.name).must_equal 'name'
    expect(recipe.photo).must_equal 'photo'
    expect(recipe.uri).must_equal 'uri'
    expect(recipe.ingredients).must_equal ['ingredients']
    expect(recipe.dietary_information).must_equal ['dietary information']

  end

  it "raises an error if name, photo are empty strings" do

    empty_string = ''
    valid = 'valid'


    expect{
      Recipe.new(empty_string, valid, valid )
    }.must_raise ArgumentError

    expect{
      Recipe.new(valid, empty_string, valid )
    }.must_raise ArgumentError

    expect{
      Recipe.new(valid, valid, empty_string )
    }.must_raise ArgumentError

  end
end
