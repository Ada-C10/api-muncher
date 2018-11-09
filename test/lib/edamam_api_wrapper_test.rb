require 'test_helper'

describe EdamamApiWrapper do

  it "can search for recipes" do
    VCR.use_cassette("list_recipes") do
      query = "pork"
      recipes = EdamamApiWrapper.list_recipes(query)
      expect(recipes).must_be_kind_of Array
    end
  end

  it "returns empty list when query is unsuccessful" do
      VCR.use_cassette("list_recipes") do
        query = "waaaaaah"
        recipes = EdamamApiWrapper.list_recipes(query)
         expect(recipes).must_equal []
      end
    end

  it "can retrieve one recipe" do
    VCR.use_cassette("show_recipe_detail") do
      id = "http%3A%2F%2Fwww.edamam.com%2Fontologies%2Fedamam.owl%23recipe_5e0a0380fcefe4cd472edb02cadd4dd7"
      recipe = EdamamApiWrapper.show_recipe_detail(id)
      expect(recipe).must_be_instance_of Recipe
      expect(recipe.id).must_equal recipe.id
    end
  end

end
