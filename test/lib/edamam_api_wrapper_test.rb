require 'test_helper'
require 'pry'

describe EdamamApiWrapper do

  describe "send message" do

    it "Must be an instance of class Recipe when the search method is called" do
      VCR.use_cassette("recipes") do
        message = "How many times does this actually send to the internet?"
        is_successful = EdamamApiWrapper.search("beans")
        expect(is_successful[0].class).must_equal Recipe
      end
    end

    it "is successful when it gets a single recipe" do
      VCR.use_cassette("recipes") do
        single_recipe_id = '9b5945e03f05acbf9d69625138385408'

        recipe = EdamamApiWrapper.show_recipe(single_recipe_id)

        expect(recipe.id).must_equal "Pressure-Cooker Octopus Recipe"
        expect(recipe.url).must_equal "http://www.seriouseats.com/recipes/2016/06/pressure-cooker-octopus-recipe.html"
        expect(recipe.image).must_equal "https://www.edamam.com/web-img/c69/c6922ad323db66d90b7d2c8d3c9cd3c4.jpg"
        expect(recipe.class).must_equal Recipe


      end
    end

  end

end
