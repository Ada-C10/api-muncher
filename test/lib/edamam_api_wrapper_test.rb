require 'test_helper'

describe EdamamApiWrapper do
  it 'can list recipess' do
    VCR.use_cassette('list_recipes_file') do
      recipes = EdamamApiWrapper.list_recipes("chicken")

      expect(recipes.length).must_be :>, 0
      recipes.each do |recipe|
        expect(recipe).must_respond_to :label
        expect(recipe).must_respond_to :uri
      end
    end
  end

  it 'can find a single recipe by its uri' do
    VCR.use_cassette('single_recipe_file') do
      recipe = EdamamApiWrapper.find_recipe_by('7543ecfa28b7506a97360748f017a83e')

      expect(recipe).must_be_instance_of Recipe
    end
  end

  it 'returns nil if non-existing uri is passed ' do
    VCR.use_cassette('single_recipe_file') do
      recipe = EdamamApiWrapper.find_recipe_by('bogus-uri')

      expect(recipe).must_equal nil
    end
  end


end  #end of slackapi wrapper block
