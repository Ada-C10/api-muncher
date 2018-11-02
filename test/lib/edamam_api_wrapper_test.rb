require 'test_helper'

describe EdamamApiWrapper do
  let (:query) { "eggplant" }

  describe "search recipes method" do
    it 'can send out a search query' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)

        expect(data["count"]).must_be :>, 0
        expect(data["count"]).wont_equal nil
      end
    end

    it 'recognizes the search query' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)

        expect(data['params']['q']).must_include query
      end
    end

    it 'returns a list of recipes' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)
        
        expect(data['hits'].count).must_equal 10
      end
    end

    it 'returns false for empty search query' do
      VCR.use_cassette('empty_search') do
        expect(EdamamApiWrapper.search_recipes('')).must_equal false
      end
    end
  end

  describe 'get one recipe method' do
    let (:uri) { "a53ef6c8495adcb9f2859b1e5d99e9ba" } #spicy eggplant recipe from Food52

    it 'returns one recipe' do
      VCR.use_cassette('single_recipe') do
        recipe = EdamamApiWrapper.get_one_recipe(uri)

        expect(recipe.count).must_equal 1
        expect(recipe[0]["uri"]).must_include uri
        expect(recipe[0]["label"]).must_include "Spicy Eggplant"
      end
    end

      it 'returns false for incorrect input' do
        VCR.use_cassette('bogus_single_recipe_input') do
          expect(EdamamApiWrapper.get_one_recipe("potatoes")).must_equal false
        end
      end

  end
end
