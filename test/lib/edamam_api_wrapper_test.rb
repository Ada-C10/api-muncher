require 'test_helper'

describe EdamamApiWrapper do
  describe 'list_recipes' do
    it 'shows a list of recipes that match a search keyword' do
      VCR.use_cassette('list_quinoia_recipes') do
        matching_recipes = EdamamApiWrapper.list_recipes('quinoa')

        expect(matching_recipes.length).must_be :>, 0

        matching_recipes.each do |recipe|
          expect(recipe).must_respond_to :name
          expect(recipe).must_respond_to :photo
          expect(recipe).must_respond_to :uri_num
        end
      end
    end

    it 'returns an empty array if no matching recipes are found' do
      VCR.use_cassette('list_no_recipes') do
        no_recipes = EdamamApiWrapper.list_recipes("")
        expect(no_recipes.length).must_equal 0
      end
    end
  end
  describe 'show_single_recipe' do
    it 'creates one Recipe object when given a valid URI num as input' do
      VCR.use_cassette('show_single_recipe') do
        uri_num = 'recipe_186eac9959d3fc7e9415107ee77a1e2c'
        single_recipe = EdamamApiWrapper.show_single_recipe(uri_num)

        expect(single_recipe).must_be_instance_of Recipe
      end
    end
    it 'returns nil if nothing matches URI num' do
      VCR.use_cassette('show_single_recipe_not_found') do
        bad_uri_num = "blahblahblah"
        single_recipe = EdamamApiWrapper.show_single_recipe(bad_uri_num)

        expect(single_recipe).must_be_nil
      end
    end
  end
end
