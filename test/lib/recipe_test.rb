require 'test_helper'

describe Recipe do
  it "will raise an argument error if created with less than 2 params" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new ('name')
    }.must_raise ArgumentError
  end
    it "can be created with a name and uri" do
      myRecipe = Recipe.new(name: "chicken", uri: "http://cat.com", image: '')
      expect (myRecipe.name).must_equal "chicken"
      expect (myRecipe.uri).must_equal "http://cat.com"
    end
    it "can be created with optional parameters" do
      myRecipe = Recipe.new("name": "beef", "uri": "http://fig.com", "image": "/image/carrot.jpg")
  end
  
end
