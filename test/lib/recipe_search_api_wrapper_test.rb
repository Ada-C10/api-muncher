require 'test_helper'

describe RecipeSearchApiWrapper do

  describe 'get recipes' do

    it 'returns an array of Recipe objects when a valid food item is successfully queried' do
      VCR.use_cassette("recipes") do
        flavor = 'mochi'

        recipes = RecipeSearchApiWrapper.get_recipes(flavor)

        recipes.must_respond_to :each
        recipes.each do |recipe|
          recipe.must_be_instance_of Recipe
        end
      end
    end

    it 'returns nil when an invalid search is queried' do
      VCR.use_cassette("recipes") do
        flavor = 'asdfqwerty'

        recipes = RecipeSearchApiWrapper.get_recipes(flavor)

        expect(recipes).must_be_nil
      end
    end
  end

  describe 'get recipe' do

    it 'returns a recipe object with the same Edamame link id as the passed in parameter if given valid input' do
      VCR.use_cassette("recipe") do
        valid_link = "http://www.edamam.com/ontologies/edamam.owl#recipe_ffadcd7a288d105c3767adb7c930bd53"

        recipe = RecipeSearchApiWrapper.get_recipe(valid_link)

        recipe.must_be_instance_of Recipe
        expect(recipe.link).must_equal valid_link
      end
    end

    it 'returns nil a recipe object with the same Edamame link id as the passed in parameter if given valid input' do
      VCR.use_cassette("recipe") do
        invalid_link = "http://www.edamam.com/ontologies/edamam.owl#recipe_fakefakefakeffadcd7a288d105c3767adb7c930bd53"

        no_recipe = RecipeSearchApiWrapper.get_recipe(invalid_link)

        no_recipe.must_be_nil
      end
    end

  end


end
