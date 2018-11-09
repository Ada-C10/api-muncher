require "test_helper"

describe RecipesController do

  it "can get the index path" do
    get recipes_index

    must_respond_with :ok
  end

  it "can get the show" do
    get ("PLACEHOLDER")

    must_respond_with :ok
  end

end
