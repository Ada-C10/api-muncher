require 'test_helper'

describe ApiMuncherWrapper do

  describe "recipes by ingredient" do

    it "returns an array of recipes" do

      VCR.use_cassette("recipes by ingredient") do
        ingredient = "broccoli"
        response = ApiMuncherWrapper.recipes_by_ingredient(ingredient)

        expect(response).must_be_kind_of Array

        response.each do |instance|
          expect(instance).must_be_kind_of Recipe
        end

        response.each do |instance|
          expect(instance).must_respond_to :label
        end

      end

    end

    it "returns an empty array if no recipes are found" do

      VCR.use_cassette("recipes by ingredient") do
        ingredient = "asdfasd"
        response = ApiMuncherWrapper.recipes_by_ingredient(ingredient)

        expect(response).must_be_kind_of Array
        expect(response.count).must_equal 0
      end

    end

  end

  describe "recipes by uri" do

    it "returns a single recipe with a valid uri" do

      VCR.use_cassette("recipe by uri") do

        uri = "ed552e2b04fbd836149044ac0e91b3fb"
        response = ApiMuncherWrapper.recipe_by_uri(uri)

        expect(response).must_be_kind_of Recipe

      end
    end


    it "returns no recipes with an invalid uri" do

      VCR.use_cassette("recipe by uri") do

        uri = ""
        response = ApiMuncherWrapper.recipe_by_uri(uri)

        expect(response).must_equal nil

      end
    end

  end

end
