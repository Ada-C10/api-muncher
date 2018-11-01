require 'test_helper'

describe Recipe do
  it "cannot be initialized without a name or id" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new(name: "Chicken Pot Pie", url: "www.test.com", image: "www.blahimageurl.com", health_labels: ["vegan", "veggie"])
    }.must_raise ArgumentError

    expect {
      Recipe.new(id: "29850895", url: "www.test.com", image: "www.blahimageurl.com", health_labels: ["vegan", "veggie"])
    }.must_raise ArgumentError
  end

  it "can be created with needed parameters id and name" do
    recipe = Recipe.new(name: "Chicken Pot Pie", id: "29850895")

    expect(recipe.name).must_equal 'Chicken Pot Pie'
    expect(recipe.id).must_equal '29850895'
    expect(recipe).must_be_instance_of Recipe
  end

  it "can set optional parameters correctly" do
    recipe = Recipe.new(name: "Chicken Pot Pie", id: "29850895", url: "www.test.com", image: "www.blahimageurl.com",
      health_labels: ["vegan", "veggie"], calories: "353", ingredients: ["chicken", "apples"])

    expect(recipe.calories).must_equal "353"
    expect(recipe.url).must_equal "www.test.com"
    expect(recipe.image).must_equal "www.blahimageurl.com"
    expect(recipe.health_labels).must_be_instance_of Array
    expect(recipe.ingredients).must_be_instance_of Array
    expect(recipe).must_be_instance_of Recipe
  end

  it "has default optional paramaters" do
    recipe = Recipe.new(name: "Chicken Pot Pie", id: "29850895")

    expect(recipe.health_labels).must_be_instance_of Array
    expect(recipe.health_labels.empty?).must_equal true
    expect(recipe.ingredients).must_be_instance_of Array
    expect(recipe.health_labels.empty?).must_equal true
    expect(recipe).must_be_instance_of Recipe
  end

end
