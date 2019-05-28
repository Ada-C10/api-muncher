require 'test_helper'


describe Recipe do
  it 'will raise ArgumentError if created with less than 2 params' do
    expect {
      Recipe.new #new recipe without params
    }.must_raise ArgumentError

    expect {
      Recipe.new('hamburger') #new recipe without an id
    }.must_raise ArgumentError
  end

  it 'can be created with a label and uri' do
    my_recipe = Recipe.new("labelname", "7543ecfa28b7506a97360748f017a83e")
    expect (my_recipe.label).must_equal "labelname"
    expect (my_recipe.uri).must_equal "7543ecfa28b7506a97360748f017a83e"
  end

  it 'can be created with optional parameters' do

    options = {
      "healthLabels": ['gluten free', 'fatty'],
      "ingredients": "sugar",
    }

    my_recipe = Recipe.new('chocolate', 12345, options)


    expect (my_recipe.label).must_equal 'chocolate'
    expect (my_recipe.uri).must_equal 12345
    expect (my_recipe.healthLabels).must_equal ['gluten free', 'fatty']
    expect (my_recipe.ingredients).must_equal "sugar"

  end

end #end of recipe describe block
