require 'test_helper'

describe Recipe do
  it "Cannot be initialized with less than 6 parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new("Label","uri","ingredients","dietaries","image")
    }.must_raise ArgumentError
  end

  it 'can be created with proper arguments, and Must initialize lable, uri, ingredients, dietaries, image, url
 properly' do
     myRecipe = Recipe.new("Chinese Chicken Dumpling Soup", "http://www.edamam.com/ontologies/edamam.owl#recipe_5ef38059cac69b777bc917b8c84bb79b", "ingredients", "[\'low fat\']", "image","url")

     expect(myRecipe.label).must_equal "Chinese Chicken Dumpling Soup"
     expect(myRecipe.uri).must_equal "5ef38059cac69b777bc917b8c84bb79b"
      expect(myRecipe.ingredients).must_equal "ingredients"
      expect(myRecipe.dietaries).must_equal "[\'low fat\']"
      expect(myRecipe.image).must_equal "image"
      expect(myRecipe.url).must_equal "url"

   end
end
