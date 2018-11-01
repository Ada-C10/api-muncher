require 'test_helper' # load in minitest, etc.

describe Recipe do
  it 'will raise an ArgumentError if created without required arguments' do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new 'chicken'
    }.must_raise ArgumentError

    expect {
      Recipe.new 'chicken', 'food.jpg'
    }.must_raise ArgumentError
  end

  it 'can be created with a label, image, and uri' do
    myRecipe = Recipe.new('chicken', 'food.jpg', 'http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_421df807e21c65c842ec62870604aed3')

    expect(myRecipe.label).must_equal 'chicken'
    expect(myRecipe.image).must_equal 'food.jpg'
    expect(myRecipe.id).must_equal '421df807e21c65c842ec62870604aed3'
  end

  it 'can be created with optional arguments' do
    myRecipe = Recipe.new('chicken', 'food.jpg', 'http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_421df807e21c65c842ec62870604aed3', ingredients: ['eggs', 'sauce'], health_info: 'gluten-free', url: 'http://www.google.com' )

    expect(myRecipe.label).must_equal 'chicken'
    expect(myRecipe.image).must_equal 'food.jpg'
    expect(myRecipe.id).must_equal '421df807e21c65c842ec62870604aed3'
    expect(myRecipe.ingredients).must_equal ['eggs', 'sauce']
    expect(myRecipe.health_info).must_equal 'gluten-free'
    expect(myRecipe.url).must_equal 'http://www.google.com'
  end
end
