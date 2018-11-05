require 'test_helper'

describe 'EdamamApiWrapper' do

  describe 'find_recipes_for' do

    it 'can find a list of recipes for a query' do

      VCR.use_cassette('find_recipes_file') do
        query = 'chicken'
        recipes = EdamamApiWrapper.find_recipes_for(query)

        expect(recipes.length).must_be :>, 0

        recipes.each do |recipe|
          expect(recipe).must_respond_to :label
          expect(recipe).must_respond_to :uri
        end

      end
    end

    it 'returns an empty array if no recipes found for query' do
      
      VCR.use_cassette('no-recipes-file') do
        query = 'zqb'
        recipes = EdamamApiWrapper.find_recipes_for(query)

        expect(recipes.length).must_equal 0
        expect(recipes.first).must_equal nil
      end

    end
  end

  describe 'find_recipe' do

    it 'can find an individual recipe from a recipe uri' do

      VCR.use_cassette('find_recipes_file') do
        uri = URI("http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2")
        parsed_id = uri.fragment

        recipe = EdamamApiWrapper.find_recipe(parsed_id)

        expect(recipe.label).must_equal "Teriyaki Chicken"
        expect(recipe.uri).must_equal uri
      end

    end

    it 'returns an empty array if uri is invalid' do
      VCR.use_cassette('no_recipe_file') do
        uri = URI("http://www.edamam.com/ontologies/edamam.owl#recipe_222222222222222222222222222")
        parsed_id = uri.fragment

        recipe = EdamamApiWrapper.find_recipe(parsed_id)

        expect(recipe.length).must_equal 0
        expect(recipe.first).must_equal nil
      end
    end

  end

end
