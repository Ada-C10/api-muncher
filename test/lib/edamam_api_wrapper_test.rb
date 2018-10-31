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

  it 'can find recipe given a valid path' do
    VCR.use_cassette('find_valid') do
      find = "http://www.edamam.com/ontologies/edamam.owl#recipe_7bf4a371c6884d809682a72808da7dc2"
      recipe = EdamamApiWrapper.find_recipe(find)

      expect(recipe).must_respond_to :label
      expect(recipe).must_respond_to :uri

    end
  end
end