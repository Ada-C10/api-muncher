require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('recipes') do
      recipes = EdamamApiWrapper.list_recipes

      expect(recipes.length).must_be :>, 0
      recipes.each do |channel|
        expect(channel).must_be_kind_of Recipe
        expect(channel).must_respond_to :name
        expect(channel).must_respond_to :id
      end
    end
  end
end
