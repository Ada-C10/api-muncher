require 'test_helper'

describe ApiMuncherWrapper do
  it 'can list recipes' do
    VCR.use_cassette('list_recipes_file') do
      recipes = ApiMuncherWrapper.list_recipes("chinese chicken dumpling")

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :uri
        expect(recipe).must_respond_to :ingredients
        expect(recipe).must_respond_to :dietaries
        expect(recipe).must_respond_to :image
        expect(recipe).must_respond_to :url
      end
    end
  end

  it 'can show recipe details with valid recipe uri' do
    VCR.use_cassette('show_recipe_details') do
      showed = ApiMuncherWrapper.recipe_detail('nodes-api-testing',
        'THIS IS CHRIS IN TESTING')

      expect(showed).must_equal true
    end
  end

  it 'can\'t show recipe to invalid recipe uri' do
    VCR.use_cassette('show_recipe_details') do
      showed = ApiMuncherWrapper.recipe_detail('nodes-api-testing',
        'THIS IS CHRIS IN TESTING')

      expect(showed).must_equal false
    end
  end
end
