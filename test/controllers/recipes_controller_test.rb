require "test_helper"

describe RecipesController do
  it "can get the index page with a valid search term" do
    VCR.use_cassette('list_of_recipes') do
      search = "salmon"
      get recipes_path, params: {search: search}

      must_respond_with :success
    end
  end

  it "respond with an error message with an invalid search term" do
    VCR.use_cassette('list_of_recipes') do
      search = "faskjl134"
      get recipes_path(search)

      expect(flash[:status]).must_equal :warning
      expect(flash[:message]).must_equal "No results for your search."
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  it "can get the show page with a valid recipe id" do
    VCR.use_cassette('single_recipe') do
      recipe_id = "7bf4a371c6884d809682a72808da7dc2"
      get recipe_path(recipe_id)

      must_respond_with :success
    end
  end

  it "respond with an error message with an invalid recipe id" do
    VCR.use_cassette('single_recipe') do
      recipe_id = "7bf4a371c6884d809682a72808da7dc3"
      get recipe_path(recipe_id)

      expect(flash[:status]).must_equal :warning
      expect(flash[:message]).must_equal "This recipe does not exist."
      must_respond_with :redirect
      must_redirect_to root_path
    end
  end
end
