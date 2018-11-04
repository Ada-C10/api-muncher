require 'test_helper'
describe 'Recipe' do

  it "Cannot be initialized without a name" do
    expect {
      Recipe.new
    }.must_raise ArgumentError
  end

  it "Must initialize name properly" do
    channel = Recipe.new("Name")
    expect(channel.name).wont_be_nil
    expect(channel.name).must_equal "Name"
  end

  it 'must raise error for empty string name' do
    empty_name = ""

    expect{
      Recipe.new(empty_name)
    }.must_raise ArgumentError
  end

  it 'must have default value for options' do
recipe = Recipe.new("bologne")
    expect(recipe.ingredients).wont_be_nil
  end

  it 'must be able to populate options' do
  end


end
