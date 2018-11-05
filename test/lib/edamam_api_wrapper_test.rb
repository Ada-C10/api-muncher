require 'test_helper'

describe EdamamApiWrapper do

  describe 'self.list_recipes' do
    it 'can query Edamam API for a list of recipes with a valid query' do
      VCR.use_cassette('recipe_queries') do
        recipes = EdamamApiWrapper.list_recipes("bitter melon")

        expect(recipes.length).must_be :>, 0
        recipes.each do |recipe|
          RECIPE_REQUIRED_ARGS.each do |attr|
            expect(recipe).must_respond_to attr
          end
        end
      end
    end

    it 'returns an empty array for an invalid query' do
      invalid_queries = [nil, ""]
      VCR.use_cassette('recipe_queries') do
        invalid_queries.each do |query|
          recipes = EdamamApiWrapper.list_recipes(query)
          expect(recipes).must_equal []
        end
      end
    end
  end

  describe 'self.get_recipe(uri)' do
    it 'can retrieve a recipe from Edamam Api with a valid Edamam uri' do
      fragment = "recipe_3d81878cd040aa6a73a2c3f11293102a"
      VCR.use_cassette('recipe_requests') do
        recipe = EdamamApiWrapper.get_recipe(fragment)
        RECIPE_REQUIRED_ARGS.each do |attr|
          expect(recipe).must_respond_to attr
        end
      end
    end

    it 'returns nil when we attempt to retrieve a bogus Edamam uri' do
      fragment = "bogus!"
      VCR.use_cassette('recipe_requests') do
        recipe = EdamamApiWrapper.get_recipe(fragment)
        assert_nil(recipe)
      end
    end
  end

  describe 'self.list_tags' do
    it 'returns a set union of health_labels that are all unique' do
      VCR.use_cassette('recipe_queries') do
        recipe_list = EdamamApiWrapper.list_recipes("bitter melon")
        tags = EdamamApiWrapper.list_tags(recipe_list, :health_labels)
        expect(tags).must_be_instance_of Array
        expect(tags.size).must_equal tags.uniq.size
      end
    end
  end

end

# it 'can send messages to valid channels' do
#   VCR.use_cassette('send_msg') do
#     worked = SlackApiWrapper.send_msg(args)
#     expect(worked).must_equal true
#   end
# end
# it 'can't send a message to bogus channels' do
# expect(worked).must_equal false
