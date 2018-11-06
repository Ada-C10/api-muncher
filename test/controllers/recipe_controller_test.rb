require "test_helper"

describe RecipeController do
  it "should get index" do
    VCR.use_cassette('search_file') do
      get recipes_path
       must_respond_with :success
    end
  end

  it "should get show for a recipe" do
    VCR.use_cassette('find_a_recipe_file') do
      get show_path(recipe)
      must_respond_with :success
    end
  end
   it 'should respond with 404 if no valid recipe is found' do
    VCR.use_cassette('find_a_recipe_file') do
      recipe = nil
      get show_path(recipe)
      must_respond_with :not_found
    end
  end
end
