require 'test_helper'

describe EdamamApiWrapper do

  it 'can list recipes' do
    VCR.use_cassette('seach_file') do  #ensure code inside block will use cassette
      hits = EdamamApiWrapper.search('food')

      expect(hits.length).must_be :>, 0
      hits.each do |hit|
        expect(hit).must_respond_to :uri
        expect(hit).must_respond_to :label
      end
    end
  end

  it 'can show a recipe'do
    VCR.use_cassette('find_a_recipe') do
      apple_pie = EdamamApiWrapper.find_a_recipe('pie')

      expect(apple_pie).must_be_kind_of Array
    end
  end
end
