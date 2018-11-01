require 'test_helper'

describe EdamamApiWrapper do
  it "can list recipes" do
    VCR.use_cassette('list_recipes') do
      recipes = EdamamApiWrapper.list_recipes("banana")

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :name
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :uri
        expect(recipe).must_respond_to :id
        expect(recipe).must_respond_to :ingredients
        expect(recipe).must_respond_to :dietary_info
      end
    end
  end

  it "can show info for one specific recipe" do
    VCR.use_cassette('show_recipe') do
      recipe = EdamamApiWrapper.show_recipe("d87818beb641e9da9e122fb8cf69ab50")

      expect(recipe).must_respond_to :name
      expect(recipe).must_respond_to :image
      expect(recipe).must_respond_to :uri
      expect(recipe).must_respond_to :id
      expect(recipe).must_respond_to :ingredients
      expect(recipe).must_respond_to :dietary_info
    end
  end

  it "cannot show info for a recipe with invalid id" do
    VCR.use_cassette('show_recipe') do
      recipe = EdamamApiWrapper.show_recipe("bob")

      expect(recipe).must_be_nil
    end
  end
end
