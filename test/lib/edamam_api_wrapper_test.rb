require 'test_helper'

describe EdamamApiWrapper do

  describe "list_recipes method" do

    it 'returns recipes given a keyword' do
      VCR.use_cassette('list_recipes') do
        response = EdamamApiWrapper.list_recipes("apple")
        response.each do |recipe|
          expect(recipe).must_be_instance_of Recipe
        end
      end
    end

    it 'returns empty array with invalid search' do
      VCR.use_cassette('invalid_search') do
        response = EdamamApiWrapper.list_recipes("bbbbbbbb")
        expect(response).must_equal []
      end
    end
  end

  describe "create_recipe method" do
    it "creates a valid recipe" do
      VCR.use_cassette('list_recipes') do
        response = EdamamApiWrapper.list_recipes("apple")
        expect(response.first).must_be_instance_of Recipe
      end
    end
  end

  describe "show_recipe method" do
    it 'returns a recipe given a valid id' do
      VCR.use_cassette('get_valid_recipe') do
        recipe = EdamamApiWrapper.show_recipe("1536d23f0618847704c4f2514d38cdcb")
        expect(recipe).must_be_instance_of Recipe
      end
    end

    it "returns empty array when given an invalid id" do
      VCR.use_cassette('get_invalid_recipe') do
        recipe = EdamamApiWrapper.show_recipe("000")
        expect(recipe).must_equal []
      end
    end
  end

end
