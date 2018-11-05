require 'test_helper'
describe 'Edamam Api Wrapper' do

  describe 'get_message' do
    it 'returns true when a valid food was successful' do
      VCR.use_cassette("channels") do
        # message = "test message"
        search_term = "burger"

        is_successful = EdamamApiWrapper.get_message("r", search_term)

        expect(is_successful).must_equal true
        #from below
      end
    end
  end

  describe 'find_recipes' do
    it 'returns array of 1 - 100 recipes for valid search, if given "r" ' do

      # expect(results.length).must_be :>=, 1
    end

    it 'returns an empty array for invalid search, if given "r" ' do
    end

    it 'returns an hash object if found, if given "q" ' do
    end

    it 'returns an empty array for invalid uri, if given "q" ' do
    end
  end

end
