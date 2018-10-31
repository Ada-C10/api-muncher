require 'test_helper'

describe Recipe do
  it 'will raise an ArgumentError if created without label or id' do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new('chicken')
    }.must_raise ArgumentError
  end

  it 'can be created with a name and a id' do
    myRecipe = Recipe.new('chicken soup', '1234')

    expect(myRecipe.label).must_equal 'chicken soup'
    expect(myRecipe.id).must_equal '1234'
  end

  it 'can be created with a name and a id' do
    options = {
      image: 'url',
      url: 'url',
      ingredients: 'string',
      health: 'string'
    }
    myRecipe = Recipe.new('chicken soup', '1234' , options)

    expect(myRecipe.label).must_equal 'chicken soup'
    expect(myRecipe.id).must_equal '1234'
    expect(myRecipe.image).must_equal 'url'
    expect(myRecipe.url).must_equal 'url'
    expect(myRecipe.ingredients).must_equal 'string'
    expect(myRecipe.health).must_equal 'string'
  end

end
