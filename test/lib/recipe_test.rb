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

  it "assigns a name, photo, and ingredients at initialization" do

    recipe = Recipe.new('name', 'photo', ['ingredient'])

    expect(recipe.name).must_equal 'name'
    expect(recipe.photo).must_equal 'photo'
    expect(recipe.ingredients).must_equal ['ingredient']

  end

  it "raises an error if name, photo are empty strings" do

    empty_string = ''
    valid = 'valid'
    valid_arr = ['valid']

    expect{
      Recipe.new(empty_string, valid, valid_arr )
    }.must_raise ArgumentError

    expect{
      Recipe.new(valid, empty_string, valid_arr )
    }.must_raise ArgumentError

  end

  it "raises an error if ingredients is empty array" do

    expect{
      Recipe.new('name', 'photo', [])
    }.must_raise ArgumentError

  end
end
