require 'test_helper'

describe 'Recipe' do
  it 'must raise an ArgumentError if created with less than two parameters' do

    expect {
      Recipe.new()
    }.must_raise ArgumentError


    expect {
      Recipe.new('boop')
    }.must_raise ArgumentError
  end

  it 'must raise an ArgumentError if created with any empty string parameters' do
    empty_string = ""
    valid_input = 'meeep'

    expect{
      Recipe.new(empty_string, valid_input)
    }.must_raise ArgumentError

    expect{
      Recipe.new(valid_input, empty_string)
    }.must_raise ArgumentError

    expect{
      Recipe.new(empty_string, empty_string)
    }.must_raise ArgumentError
  end

  it 'can be created with two valid parameters' do
    uri = URI('http://fake')
    recipe = Recipe.new('chicken', uri)

    expect(recipe.label).must_equal 'chicken'
    expect(recipe.uri).must_equal uri
  end

  it 'can be created with optional parameters and set it correctly' do
    uri = URI('http://beepbopboop')

    recipe = Recipe.new(
      'fajitas',
      uri,
      options = {
      image: 'image',
      source: 'source',
      url: 'http://originalrecipe',
      ingredients: ['peppers', 'onions', 'beef'],
      calories: 12345,
      diet_labels: ['high-protein'],
      health_labels: ['paleo']
      }
    )

    expect(recipe.image).must_equal 'image'
    expect(recipe.source).must_equal 'source'
    expect(recipe.url).must_equal 'http://originalrecipe'
    expect(recipe.ingredients).must_equal ['peppers', 'onions', 'beef']
    expect(recipe.calories).must_equal 12345
    expect(recipe.diet_labels).must_equal ['high-protein']
    expect(recipe.health_labels).must_equal ['paleo']
  end



end
