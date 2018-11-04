require 'test_helper'

describe "Recipe" do
    let(:recipe_name) { "Teriyaki Chicken" }
    let(:image) {  "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg" }
    let(:uri) { "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" }
    let(:url) { "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/" }
    let(:ingredients) { [ {"text" =>"1/2 cup olive oil"}, {"text" => "2lbs chicken"} ] }
    let(:id) {
      ( URI.encode ( "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" ) )[/[^_]+$/]
    }
    let(:dietLabels) { dietLabels = ["vegan", "egg-free"] }

  it "Cannot be initialized without required parameters" do
    # Missing all
    expect {
      Recipe.new
    }.must_raise ArgumentError

    # Missing all but name
    expect {
      Recipe.new recipe_name
    }.must_raise ArgumentError

   # Missing uri, url, ingredients
    expect {
      Recipe.new recipe_name, image
    }.must_raise ArgumentError

   # Missing url, ingredients
    expect {
      Recipe.new recipe_name, image, uri
    }.must_raise ArgumentError

   # missing ingredients
    expect {
        Recipe.new recipe_name, image, uri, url
     }.must_raise ArgumentError


  end

  it "Must initialize name, image, uri, url, ingredients, and id properly" do
      recipe = Recipe.new(recipe_name, image, uri, url, ingredients)
      expect(recipe.name).must_equal recipe_name
      expect(recipe.image).must_equal image
      expect(recipe.uri).must_equal uri
      expect(recipe.url).must_equal url
      expect(recipe.ingredients).must_equal ingredients
      expect(recipe.id).must_equal id
  end

  it "can have optional fields" do
    dietLabels = ["vegan", "egg-free"]
    recipe = Recipe.new(recipe_name, image, uri, url, ingredients, dietLabels)

    expect(recipe.name).must_equal recipe_name
    expect(recipe.image).must_equal image
    expect(recipe.uri).must_equal uri
    expect(recipe.url).must_equal url
    expect(recipe.ingredients).must_equal ingredients
    expect(recipe.id).must_equal id
    expect(recipe.dietLabels).must_equal dietLabels

  end
end
