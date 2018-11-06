require 'test_helper'

describe EdamamApiWrapper do

  describe "search" do
    it "returns correct number of recipes when a valid recipe word was entered" do
      VCR.use_cassette("recipes") do
        is_successful = EdamamApiWrapper.search("cookie")

        expect(is_successful.length).must_equal 50
      end
    end
    #
    it "is not successful when sending an invalid recipe name" do
      VCR.use_cassette("recipes") do
        all_recipes = EdamamApiWrapper.search("asdf")
        expect(all_recipes.length).must_equal 0
      end
    end
  end

  describe "show recipe" do
    it "shows one instance of the recipe for valid recipe id" do
      VCR.use_cassette("recipes") do
        all_recipes = EdamamApiWrapper.search("cookie")
        is_successful = EdamamApiWrapper.show_recipe("#{all_recipes[0].id}")
        expect([is_successful].length).must_equal 1
        expect(is_successful).must_be_instance_of Recipe
      end
    end
  end

  describe "create recipe " do
    it "does not create an instance of Recipe if recipe is nil" do
      VCR.use_cassette("recipes") do
        recipe = nil
        # binding.pry
        test_case = EdamamApiWrapper.create_recipe(recipe)

        expect(test_case).must_equal nil
      end
    end
  end

  describe "id from uri" do
    it "must get the id from the uri" do
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_115b7da63f48e228cfdbf88e0e0a338a"
      formatted_uri = EdamamApiWrapper.id_from_uri(uri)

      expect(formatted_uri).must_equal "115b7da63f48e228cfdbf88e0e0a338a"
    end
  end

  describe "uri from id" do
    it "must combine url with id" do
      result = EdamamApiWrapper.uri_from_id("115b7da63f48e228cfdbf88e0e0a338a")
      expect(result).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_115b7da63f48e228cfdbf88e0e0a338a"
    end
  end
end
