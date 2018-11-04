require 'test_helper'

describe 'Recipe' do
  it 'can create a Recipe instance' do
    input = {
      label: "apple",
      image: "apple.jpg",
      source: "google.com",
      url: "blahblahblah",
      id: "applesauce",
      dietLabels: nil,
      healthLabels: nil,
      ingredientLines: nil
    }

    new_recipe = Recipe.new(input)
    expect(new_recipe).must_be_kind_of Recipe
  end
end
