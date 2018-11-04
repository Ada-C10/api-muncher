require 'test_helper'

describe ApiMuncherWrapper do
  before do
    @uri = "5ef38059cac69b777bc917b8c84bb79b"
    @uri_2 = "5ef38059cac69b777bc917b8c84bb"
  end
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

  it 'cannot list recipes with invliad search keyword' do
    VCR.use_cassette('list_recipes_file') do
      recipes = ApiMuncherWrapper.list_recipes("@")

      expect(recipes).must_equal []
    end
  end

  it 'can show recipe details with valid recipe uri' do
    VCR.use_cassette('show_recipe_details') do
      showed = ApiMuncherWrapper.recipe_detail(@uri)

      expect(showed).must_be_instance_of Recipe
      expect(showed.uri).must_equal @uri
    end
  end

  it 'can\'t show recipe to invalid recipe uri' do

    VCR.use_cassette('show_recipe_details') do
      showed = ApiMuncherWrapper.recipe_detail(@uri_2)

      expect(showed).must_equal nil
    end
  end
end
