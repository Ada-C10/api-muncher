require 'test_helper'

describe EdamamApiWrapper do

  describe 'search' do
    it 'can retrieve data' do
      VCR.use_cassette("recipes") do
        string = 'teriyaki'
        response = EdamamApiWrapper.search(string)
        response["count"].must_equal 3388
      end
    end
  end

end
