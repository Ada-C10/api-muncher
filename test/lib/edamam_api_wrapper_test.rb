require 'test_helper'

describe EdamamApiWrapper do

  describe 'recipe_search' do
    it 'can list recipes given a search term' do
      VCR.use_cassette('recipe_search') do
        recipes = EdamamApiWrapper.recipe_search('tofu')

        expect(recipes.length).must_be :>, 0

        recipes.each do |recipe|
          expect(recipe).must_respond_to :label
          expect(recipe).must_respond_to :image
          expect(recipe).must_respond_to :uri
          expect(recipe).must_respond_to :id
        end
      end
    end

    it 'returns an empty array if no results are found' do
      VCR.use_cassette('recipe_search') do
        recipes = EdamamApiWrapper.recipe_search('qmwmemrmtmmtmy')

        expect(recipes).must_equal []
      end
    end

  end


  describe 'show_recipe' do
    it 'shows a recipe given a valid id' do
      VCR.use_cassette('show_recipe') do
        recipe = EdamamApiWrapper.show_recipe("5c16802dd815e76ce94487b567073877")

        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :uri
        expect(recipe).must_respond_to :id
        expect(recipe).must_respond_to :ingredientLines
        expect(recipe).must_respond_to :healthLabels

      end
    end

    it 'returns nil given an invalid id' do
      VCR.use_cassette('show_recipe') do
        recipe = EdamamApiWrapper.show_recipe("absolutegarbage")

        expect(recipe).must_be_nil
      end
    end

  end



end
