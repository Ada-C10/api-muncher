require 'test_helper'

describe "EdamamApiWrapper" do

  describe "search recipes" do

    it "returns list of recipes when query is successful" do
      VCR.use_cassette("recipes") do
        query = "chicken"
        recipes = EdamamApiWrapper.search_recipes(query)

        expect(recipes).must_respond_to :each
        recipes.each do |recipe|
          expect(recipe).must_be_instance_of Recipe
        end

      end
    end

    it "returns empty list when query is unsuccessful" do
      VCR.use_cassette("recipes") do
        query = "foobar"
        recipes = EdamamApiWrapper.search_recipes(query)

        expect(recipes).must_equal []
      end
    end

  end

  describe "find recipe" do
    let (:uri) {
      "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
    }

    it "return recipe when uri is valid" do


      VCR.use_cassette("recipe") do

        recipe = EdamamApiWrapper.find_recipe(uri)
        expect(recipe).must_be_instance_of Recipe
        expect(recipe.uri).must_equal uri
      end

    end

    it "returns nil when uri is invalid" do

      VCR.use_cassette("recipe") do
        uri = 'foobar'
        recipe = EdamamApiWrapper.find_recipe(uri)

        expect(recipe).must_be_nil
      end


    end
  end



end
