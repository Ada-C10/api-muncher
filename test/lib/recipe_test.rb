require 'test_helper'

describe Recipe do
  it 'will raise an arg error if created with < 2 params' do
    expect {Recipe.new(nil, nil,  nil, nil, nil)}.must_raise ArgumentError
    expect {Recipe.new("one", nil, nil, nil, nil)}.must_raise ArgumentError
  end

  it 'can be created with label and uri' do
    new_recipe = Recipe.new("test//uri", "test-label",nil,nil,  nil)

    expect(new_recipe.label).must_equal "test-label"
    expect(new_recipe.uri).must_equal "test//uri"
  end

  it 'can be created with optional parameters' do
    new_recipe = Recipe.new("http://bar","foo", "image//foobar", nil,nil)
    expect(new_recipe.image).must_equal "image//foobar"
  end
end