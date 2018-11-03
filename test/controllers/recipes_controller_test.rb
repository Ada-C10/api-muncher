require "test_helper"

describe RecipesController do
  it "should get index" do
    VCR.use_cassette('list_recipes_file') do
      get recipes_path

      must_respond_with :ok
    end
  end
  
  it "should get show for a valid recipe" do
    VCR.use_cassette('recipe_file') do

      recipe = "d4c5f84bb24731bda2055195620a799c"
      get show_path(recipe)
      must_respond_with :success
    end
  end

  it 'should respond with 404 if no valid recipe is found' do
    VCR.use_cassette('recipe_file') do

      recipe = "test"
      get show_path(recipe)
      must_respond_with :not_found
    end
  end
end
