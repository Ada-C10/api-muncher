require 'test_helper'

describe Recipes do

  it 'gets information from recipe, including name, source, and ingredients' do
    VCR.use_cassette('single_recipe') do

      # recipe = single_recipe.retrieve_recipe_info

      ap single_recipe

      # expect(recipe.name).must_be_instance of String
    end
  end

end
