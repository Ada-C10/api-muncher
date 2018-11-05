require 'test_helper'

describe "EdamamApiWrapper" do
  describe "list recipe" do
    it 'lists recipes according to search term' do
      VCR.use_cassette("recipes") do
        word = "eggs"
        recipe_list = EdamamApiWrapper.list_recipes(word)

        recipe_list.each do |recipe|
          recipe.must_be_kind_of Recipe
        end
      end
    end
    it 'gets an empty array for no food item' do
      VCR.use_cassette("recipes") do
        word = "Gemfile"
        recipe_list = EdamamApiWrapper.list_recipes(word)

        expect(recipe_list).must_equal []
      end
    end
  end
end
