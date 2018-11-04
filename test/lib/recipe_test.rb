require 'test_helper'

describe "Recipe" do
  it "Cannot be initialized without required parameters" do
    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new "Chicken"
    }.must_raise ArgumentError
   #
    expect {
      Recipe.new "Chicken", "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
    }.must_raise ArgumentError
   #
    expect {
      Recipe.new
      "Chicken"
      "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
      "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
   }.must_raise ArgumentError
   #
    expect {
      Recipe.new
        "Chicken"
        "https://w.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
     }.must_raise ArgumentError
   #
    expect {
      Recipe.new
        "Chicken"
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
    }.must_raise ArgumentError
   #
    expect {
      Recipe.new
        "Chicken"
        "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
        "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
        "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
        [
          {"text" =>"1/2 cup olive oil"},
          {"text" => "2lbs chicken"}
        ]
     }.must_raise ArgumentError

     expect {
       Recipe.new
         "Chicken"
         "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg"
         "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
         "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/"
         [
           {"text" =>"1/2 cup olive oil"},
           {"text" => "2lbs chicken"}
         ]
         "7bf4a371c6884d809682a72808da7dc2"
      }.must_raise ArgumentError

  end

  it "Must initialize name, image, uri, url, ingredients, and id properly" do

      # recipe = Recipe.new(
      #   "Teriyaki Chicken",
      #   "https://www.edamam.com/web-img/262/262b4353ca25074178ead2a07cdf7dc1.jpg",
      #   "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2",
      #   "http://www.davidlebovitz.com/2012/12/chicken-teriyaki-recipe-japanese-farm-food/",
      #   [{"text"=>"1/2 cup olive oil", "weight"=>108.0},
      #     {"text"=>"5 cloves garlic, peeled", "weight"=>15.0}]
      #     [/[^_]+$/]
      # )

      recipe =  Recipe.new( "name", "image", "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2", "url", "ingredients", ( URI.encode  ( "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" ) )[/[^_]+$/] )

      expect(recipe.name).must_equal "name"
      expect(recipe.image).must_equal "image"
      expect(recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
      expect(recipe.url).must_equal "url"
      expect(recipe.ingredients).must_equal "ingredients"
      expect(recipe.id).must_equal ( URI.encode  ( "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" ) )[/[^_]+$/]
  end

  it "can have optional fields" do
    dietLabels = ["vegan", "egg-free"]
    recipe =  Recipe.new( "name", "image", "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2", "url", "ingredients", ( URI.encode  ( "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" ) )[/[^_]+$/], dietLabels )

    expect(recipe.name).must_equal "name"
    expect(recipe.image).must_equal "image"
    expect(recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
    expect(recipe.url).must_equal "url"
    expect(recipe.ingredients).must_equal "ingredients"
    expect(recipe.id).must_equal ( URI.encode  ( "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2" ) )[/[^_]+$/]
    expect(recipe.dietLabels).must_equal dietLabels

  end
end
