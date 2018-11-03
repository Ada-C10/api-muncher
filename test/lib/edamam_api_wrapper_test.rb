require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipes' do
    VCR.use_cassette('search_file') do #yml file
      recipes = EdamamApiWrapper.search

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :url
        expect(recipe).must_respond_to :label
      end
    end
  end

  it 'can show a recipe'
  end


end
