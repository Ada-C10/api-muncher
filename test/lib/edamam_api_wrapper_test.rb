require 'test_helper'

describe EdamamApiWrapper do

  describe 'search' do
    it 'can retrieve data' do
      VCR.use_cassette("recipes") do
        string = 'teriyaki'
        response = EdamamApiWrapper.search(string)
        response.must_respond_to :each
      end
    end
  end

end
