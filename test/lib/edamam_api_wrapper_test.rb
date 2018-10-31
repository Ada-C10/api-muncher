require 'test_helper'

describe EdamamApiWrapper do
  it "can list recipes" do
    VCR.use_cassette('list_of_recipes') do
      search = "salmon"
      recipes = EdamamApiWrapper.list_recipes(search)

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :id
      end
    end
  end

  it "will return an empty array if no results are found for list recipes" do
    VCR.use_cassette('list_of_recipes') do
      search = "faskjl134"
      recipes = EdamamApiWrapper.list_recipes(search)

      expect(recipes.length).must_equal 0
    end
  end

  it "can get recipe details" do
    VCR.use_cassette('single_recipe') do
      recipe = EdamamApiWrapper.recipe_details("7bf4a371c6884d809682a72808da7dc2")

      expect(recipe).must_be_instance_of Recipe
      expect(recipe).must_respond_to :label
      expect(recipe).must_respond_to :image
      expect(recipe).must_respond_to :id
    end
  end

  it "will return an empty array if no results are found for individual recipe details" do
    VCR.use_cassette('list_of_recipes') do
      id = "7bf4a371c6884d809682a72808da7dc3"
      recipe = EdamamApiWrapper.recipe_details(id)

      expect(recipe.length).must_equal 0
    end
  end
end
