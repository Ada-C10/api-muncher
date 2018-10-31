require 'test_helper'

# use VCR to record requests to API and API response
describe EdamamApiWrapper do
  it 'can return recipes' do
    VCR.use_cassette('recipes') do
      search = "beef"
      recipes = EdamamApiWrapper.list_recipes(search)

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :uri
      end
    end

  end

  # more tests for other methods
  # VCR.use_cassette('recipes') do
  # worked = EdamamApiWrapper.method(xxxx)
  # expect(worked).must_equal
  #
  it "returns empty array if no data" do
    VCR.use_cassette('no_search') do
      search = nil
      recipes = EdamamApiWrapper.list_recipes(search)

      expect(recipes).must_be_empty
    end

  end

  it 'returns an empty array if garbage data' do
    VCR.use_cassette('bad_search') do
      search = "@#%%"
      recipes = EdamamApiWrapper.list_recipes(search)

      expect(recipes).must_be_empty
    end

  end
end