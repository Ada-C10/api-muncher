require 'test_helper'

describe "Recipe" do
  it "Cannot be initialized without required parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new "Chicken"
    }.must_raise ArgumentError

    expect {
      Recipe.new "Chicken", "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
    }.must_raise ArgumentError

    expect {
      Recipe.new (
        "Chicken",
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
    ) }.must_raise ArgumentError

    expect {
      Recipe.new (
        "Chicken",
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
    ) }.must_raise ArgumentError

    expect {
      Recipe.new (
        "Chicken",
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
    ) }.must_raise ArgumentError

    expect {
      Recipe.new (
        "Chicken",
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/",
        [
          {"text" =>"1/2 cup olive oil"},
          {"text" => "2lbs chicken"}
        ]
    ) }.must_raise ArgumentError

  end

  it "Must initialize name, image, uri, url, ingredients, and id properly" do
      recipe = Recipe.new ( "label", "image", "uri", "url", "ingredients", "id" )
      expect(recipe.label).must_equal "label"
      expect(recipe.image).must_equal "image"
      expect(recipe.uri).must_equal "uri"
      expect(recipe.url).must_equal "url"
      expect(recipe.ingredients).must_equal "ingredients"
      expect(recipe.id).must_equal "id"

  end

  it "can have optional fields" do
    dietLabels = ["vegan", "egg-free"]
    recipe = Recipe.new ( "label", "image", "uri", "url", "ingredients", "id", dietLabels )
    expect(recipe.label).must_equal "label"
    expect(recipe.image).must_equal "image"
    expect(recipe.uri).must_equal "uri"
    expect(recipe.url).must_equal "url"
    expect(recipe.ingredients).must_equal "ingredients"
    expect(recipe.id).must_equal "id"
    expect(recipe.dietLabels).must_equal dietLabels

  end
end
