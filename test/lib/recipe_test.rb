require 'test_helper'

describe Recipe do

  describe 'initialize' do
    it 'responds to .valid? and returns false if any required args are nil or empty' do
      args = {label: ""}
      recipe = Recipe.new(args)
      expect(recipe.valid?).must_equal false
      expect(recipe).must_respond_to :ingredient_lines
    end

    it 'can be created with valid arguments' do
      recipe = Recipe.new(RECIPE_REQUIRED_ARGS_HASH)
      expect(recipe.valid?).must_equal true
      RECIPE_REQUIRED_ARGS.each_with_index do |key, index|
        expect(recipe.send(key)).must_equal RECIPE_REQUIRED_VALUES[index]
      end
    end

  end
end
