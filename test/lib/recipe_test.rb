require 'test_helper'

describe Recipe do

  it "will raise ArgumentError if less than two parameters" do
    expect{
      Recipe.new
    }.must_raise ArgumentError

    expect{
      Recipe.new("Salt Preserved Lemons")
    }.must_raise ArgumentError
  end

  it "can be created with a name and id" do
    new_recipe = Recipe.new('chicken', "12345")

    expect(new_recipe.label).must_equal 'chicken'
    expect(new_recipe.uri).must_equal '12345'
  end

  it 'can be created with all params' do
    new_recipe = Recipe.new('chicken', "12345", ingredients: 'lemon, pepper', health: 'dairy free', image: 'image', url: 'url')

    expect(new_recipe.label).must_equal 'chicken'
    expect(new_recipe.uri).must_equal '12345'
    expect(new_recipe.health).must_equal 'dairy free'
    expect(new_recipe.image).must_equal "image"
    expect(new_recipe.url).must_equal 'url'
  end

end
