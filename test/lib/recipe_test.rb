require 'test_helper'

describe Recipe do

  describe 'initialize' do
    it 'responds to .valid? and returns false if any required args are nil or empty' do
      invalid_args = {key1: nil, key2: "", key3: []}
      invalid_args.each_pair do |pair|
        recipe = Recipe.new(pair)
        expect(recipe).must_respond_to .valid?
        expect(recipe.valid?).must_equal false
      end
    end

    it 'can be created with valid arguments' do
      args = Hash.new
      RECIPE_VALID_ATTRS.each do |key|
        RECIPE_VALID_VALUES.each do |value|
          args[key] = value
          recipe = Recipe.new(args)
          expect(recipe.send(key)).must_equal value
        end
      end

    end
  end
end
