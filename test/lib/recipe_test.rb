require 'test_helper'

describe Recipe do

  TEST_ARGS= {
    "uri" => "test",
    "label"=> "test"
  }
  BAD_ARG = { "uri" => "test"}
  BAD_ARG2 = { "label" => "test"}

  it "raises an error if uri and label DNE" do

    expect {
      Recipe.new
    }.must_raise ArgumentError

    expect {
      Recipe.new(BAD_ARG)
    }.must_raise ArgumentError

    expect {
      Recipe.new(BAD_ARG2)
    }.must_raise ArgumentError
  end
  #
  it "assigns a name and an ID at initialization" do
    recipe = Recipe.new(TEST_ARGS)
    expect(recipe.id).wont_be_nil
    expect(recipe.id).must_equal 'test'

    expect(recipe.name).wont_be_nil
    expect(recipe.name).must_equal 'test'
  end

end
