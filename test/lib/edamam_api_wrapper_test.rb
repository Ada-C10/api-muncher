require 'test_helper'

describe EdamamApiWrapper do
  let (:query) { "eggplant" }

  describe "search recipes method" do

    it 'can send out a search query' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)

        expect(data.count).must_be :>, 0
        expect(data.count).wont_equal nil
      end
    end

    it 'recognizes the search query' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)

        first = data.first
        last = data.last

        expect(first.title.downcase).must_include "eggplant"
        expect(last.title.downcase).must_include "eggplant"
      end
    end

    it 'returns a list of recipes' do
      VCR.use_cassette('search_list') do
        data = EdamamApiWrapper.search_recipes(query)

        data.each do |recipe|
          expect(recipe).must_respond_to :title
          expect(recipe).must_respond_to :photo
          expect(recipe).must_respond_to :ingredients
          expect(recipe).must_respond_to :recipe_id
          expect(recipe).must_respond_to :servings
          expect(recipe).must_respond_to :restrictions
          expect(recipe).must_respond_to :diet
          expect(recipe).must_respond_to :prep_time
          expect(recipe).must_respond_to :calorie_count
          expect(recipe).must_respond_to :restrictions
        end
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
        recipe = EdamamApiWrapper.recipe_contents(uri)

        expect(recipe).must_be_instance_of Recipes
        expect(recipe.recipe_id).must_include uri
        expect(recipe.title).must_include "Spicy Eggplant"

        expect(recipe).must_respond_to :photo
        expect(recipe).must_respond_to :ingredients
        expect(recipe).must_respond_to :servings
        expect(recipe).must_respond_to :restrictions
        expect(recipe).must_respond_to :diet
        expect(recipe).must_respond_to :prep_time
        expect(recipe).must_respond_to :calorie_count
        expect(recipe).must_respond_to :restrictions
      end
    end

      it 'returns false for incorrect input' do
        VCR.use_cassette('bogus_single_recipe_input') do
          expect(EdamamApiWrapper.recipe_contents("potatoes")).must_equal false
        end
      end

  end
end
