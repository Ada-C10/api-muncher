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
        end
      end
    end

    it 'does something else if no results are found' do
      VCR.use_cassette('recipe_search') do
        recipes = EdamamApiWrapper.recipe_search('qmwmemrmtmmtmy')

        expect(recipes).must_equal "No recipes found!  You've entered a food desert!"
      end
    end

  end


  describe 'show_recipe' do
    it 'shows a recipe given a valid id' do
    end

    it 'does something else given an invalid id' do
    end

  end



end
