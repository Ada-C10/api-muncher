require 'test_helper'
require 'pry'

describe EdamamApiWrapper do

  describe "EdamamApiWrapper#send_search" do

    it 'can return a response for a given query string and no health labels' do
      VCR.use_cassette('send_search') do
        response = EdamamApiWrapper.send_search("chicken pot pie", [])

        expect(response.length).must_be :>, 0
        response.each do |item|
          expect(item).must_be_instance_of Recipe
        end
      end
    end

    it 'can return a response for a given query string with health labels' do
      VCR.use_cassette('send_search') do
        response = EdamamApiWrapper.send_search("muffin", ["peanut-free"])

        expect(response.length).must_be :>, 0
        response.each do |item|
          expect(item).must_be_instance_of Recipe
        end
      end
    end

    it 'returns nil when given an invalid search' do
      VCR.use_cassette('bogus_search') do
        response = EdamamApiWrapper.send_search("28402850528ad", [])

        expect(response).must_equal nil
      end
    end

  end

  describe "EdamamApiWrapper#retrieve_recipe" do
    it 'can return a single recipe as a response when given a valid recipe id' do
      VCR.use_cassette('get_valid_recipe') do
        recipe = EdamamApiWrapper.retrieve_recipe("9b5945e03f05acbf9d69625138385408")

        expect(recipe.length).must_equal 1
      end
    end

    it "won't return a response when given an invalid recipe id" do
      VCR.use_cassette('get_bogus_recipe') do
        recipe = EdamamApiWrapper.retrieve_recipe("359898")

        expect(recipe).must_be_empty
      end
    end

  end

  describe "EdamamApiWrapper#create_recipe" do
    it "can appropriately parse the params response so recipe can be created" do
      VCR.use_cassette('send_search') do
        response = EdamamApiWrapper.send_search("chicken pot pie", [])
        expect(response.length).must_be :>, 0


        expect(response.first).must_be_instance_of Recipe
      end
    end

  end
end
