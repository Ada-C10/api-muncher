require 'test_helper'

describe Recipe do

  describe 'initialize' do
    it 'raises ArgumentError if any args are nil or empty' do
      invalid_args = {key1: nil, key2: "", key3: []}
      invalid_args.each_pair do |pair|
        expect {
          Recipe.new(pair)
        }.must_raise ArgumentError
      end

    end

    it 'can be created with valid arguments' do
      args = Hash.new
      valid_keys = [:label, :recipe_uri, :image_uri, :source, :source_uri, :recipe_yield, :health_labels, :ingredient_lines, :total_time]
      valid_values = ["some recipe", "http://", "http://", "source", "http://", "http://", "yields 100", ["labels"], ["ingredients"], 30]
      valid_keys.each do |key|
        valid_values.each do |value|
          args[key] = value
          recipe = Recipe.new(args)
          expect(recipe.send(key)).must_equal value
        end
      end

    end
  end
end
