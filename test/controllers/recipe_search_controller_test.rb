require "test_helper"

describe RecipeSearchController do
  it "should get search" do
    get root_path
    must_respond_with :success
  end

  it "should get index" do
    VCR.use_cassette('list_recipes_file') do
      get recipe_searches_path
      must_respond_with :success
    end
  end

  # it "should get show with valid Edamam uri (ID)" do
  #   fragment = "recipe_3d81878cd040aa6a73a2c3f11293102a"
  #   VCR.use_cassette('get_recipe_file') do
  #     get recipe_path(fragment)
  #     must_respond_with :success
        # expect(flash[:status]).must_equal :success
  #   end
  # end

  # it "should not get show with an invalid Edamam uri (ID)" do
  #   fragment = "invalid"
  #   get recipe_path(fragment)
  #   must_respond_with :not_found
  #   expect(flash[:status]).must_equal :failure
  # end

end
