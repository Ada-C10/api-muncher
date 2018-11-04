require 'test_helper'

describe EdamamApiWrapper do
  describe 'find_recipes' do
    it 'returns an array of recipes for a valid search term' do
      VCR.use_cassette("recipes") do
        search_term = "apple"
        response = EdamamApiWrapper.find_recipes(search_term)
        expect(response).must_be_kind_of Array
      end
    end
  end

  describe 'create_recipe' do
    # Recipe class but no model
    it 'creates a Recipe instance' do
      recipe = {
        "label" => "apple",
        "image" => "apple.jpg",
        "source" => "applebutt",
        "url" => "googleapple",
        "uri" => "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6",
        "dietLabels" => nil,
        "healthLabels" => nil,
        "ingredientLines" => nil
      }

      VCR.use_cassette("recipes") do
        recipe_instance = EdamamApiWrapper.create_recipe(recipe)
        expect(recipe_instance).must_be_kind_of Recipe
      end
    end

  end

  describe 'find_specific_recipe' do
    it 'returns a specific recipe' do
      recipe_id = "recipe_b79327d05b8e5b838ad6cfd9576b30b6"
      VCR.use_cassette("recipes") do
        specific_recipe = EdamamApiWrapper.find_specific_recipe(recipe_id)
        expect(specific_recipe).must_be_kind_of Recipe
      end
    end
  end

  describe 'parse_recipe_id' do
    it 'returns the recipe id' do
      id = "recipe_b79327d05b8e5b838ad6cfd9576b30b6"
      uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6"
      VCR.use_cassette("recipes") do
        recipe_id = EdamamApiWrapper.parse_recipe_id(uri)
        expect(recipe_id).must_equal id
      end
    end
  end
end
