require 'test_helper'
require 'pry'

describe EdamamApiWrapper do

  describe "EdamamApiWrapper#send_search" do

    it 'can return a response for a given query string' do
      VCR.use_cassette('send_search') do
        response = EdamamApiWrapper.send_search("chicken pot pie")

      expect(response["hits"].length).must_be :>, 0
        response["hits"].each do |item|
          expect(item["recipe"]).wont_be_nil
        end
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
        response = EdamamApiWrapper.send_search("chicken pot pie")

        #set-up - check that we have some recipe params to work with
        expect(response["hits"].length).must_be :>, 0

        #creating recipe
        recipe = EdamamApiWrapper.create_recipe(response["hits"][0]["recipe"])

        expect(recipe).must_be_instance_of Recipe
      end
    end

  end
end
