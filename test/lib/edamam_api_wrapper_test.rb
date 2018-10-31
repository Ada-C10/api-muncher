require 'test_helper'

describe EdamamApiWrapper do

  describe 'self.list_recipes' do
    it 'can list recipes' do
      # set up a VCR block
      VCR.use_cassette('recipes') do
        recipes = EdamamApiWrapper.list_recipes("lemongrass")

        expect(recipes.length).must_be :>, 0
        recipes.each do |recipe|
          RECIPE_VALID_ATTRS.each do |attr|
            expect(recipe).must_respond_to attr
          end
        end
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
