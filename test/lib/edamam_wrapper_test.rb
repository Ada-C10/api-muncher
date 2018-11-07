require 'test_helper'
describe 'Edamam Api Wrapper' do

  describe 'get_message' do
    it 'returns true when a valid food was successful' do
      VCR.use_cassette("valid_search") do
        # message = "test message"
        search_term = "burger"

        is_successful = EdamamApiWrapper.get_message("q", search_term)

        expect(is_successful).must_equal true
        #from below
      end
    end

    it 'returns true when a valid uri was successful' do
      VCR.use_cassette("valid_uri") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_922c78a6f613840e1e3162adf4ee9918"

        is_successful = EdamamApiWrapper.get_message("r", uri)

        expect(is_successful).must_equal true
      end
    end
  end

  describe 'query_search' do
    it 'returns array of 1 - 100 valid recipes for valid query search term' do
      VCR.use_cassette("valid_search") do
        # message = "test message"
        search_term = "burger"

        results = EdamamApiWrapper.query_search(search_term)

        expect(results).must_be_kind_of Array
        expect(results.length).must_be :>=, 1
        expect(results.length).must_be :<=, 100

        results.each do |recipe|
          expect(recipe).must_be_kind_of Recipe
        end
      end
    end

    it 'returns an empty array for invalid query search term' do
      VCR.use_cassette("invalid_search") do
        # message = "test message"
        search_term = "lsljsaljjlsldjaskllkjdsajkl"

        results = EdamamApiWrapper.query_search(search_term)

        expect(results).must_equal []
      end
    end
  end

  describe 'uri_search' do

    it 'returns a valid recipe if given valid uri' do

      VCR.use_cassette("valid_uri") do
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_922c78a6f613840e1e3162adf4ee9918"

        result = EdamamApiWrapper.uri_search(uri)

        expect(result).must_be_kind_of Recipe
      end
    end

    it 'returns an nil for invalid uri' do
      VCR.use_cassette("invalid_uri") do
        uri = "http://url.com"

        result = EdamamApiWrapper.uri_search(uri)

        expect(result).must_be_nil
      end
    end
  end
end
