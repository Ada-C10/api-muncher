require 'test_helper'

describe EdamamApiWrapper do

  describe '.search' do
    it 'returns array of recipes when search string is provided' do
      VCR.use_cassette("recipes") do
        string = 'teriyaki'
        response = EdamamApiWrapper.search(string)

        expect(response).must_respond_to :each
      end
    end

    it 'returns empty array when search string is empty' do
      VCR.use_cassette("recipes") do
        empty_string_response = EdamamApiWrapper.search("")
        expect(empty_string_response.length).must_equal 0
        expect(empty_string_response).must_respond_to :each

        nil_string_response = EdamamApiWrapper.search(nil)
        expect(nil_string_response.length).must_equal 0
        expect(nil_string_response).must_respond_to :each
      end
    end
  end

  describe '.find_recipe' do
    it 'returns single recipe when valid id is provided' do
      VCR.use_cassette("recipes") do
        valid_id = "888e9fc4a808e9e4ccdb2ac24a6a2f46"
        response = EdamamApiWrapper.find_recipe(valid_id)
        expect(response).must_be_kind_of Recipe

        response_id = response.uri.last(32)
        expect(response_id).must_equal valid_id
      end
    end

    it 'raises ArgumentError if id is not provided' do
      VCR.use_cassette("recipes") do
        expect {
          EdamamApiWrapper.find_recipe()
        }.must_raise ArgumentError
      end
    end

    it 'returns empty recipe instance if invalid id is provided' do
      VCR.use_cassette("recipes") do
        invalid_ids = ["", nil, "123", "123456789123456789123456789123456789123456789"]
        invalid_ids.each do |invalid_id|
          response = EdamamApiWrapper.find_recipe(invalid_id)
          expect(response).must_be_kind_of Recipe
          recipe_attrs = %i[diet_labels image ingredients label source uri]
          recipe_attrs.each do |recipe_attr|
            expect(response).must_respond_to recipe_attr
          end
        end
      end
      
    end
  end

end
