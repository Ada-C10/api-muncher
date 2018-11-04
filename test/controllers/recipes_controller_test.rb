require "test_helper"

describe RecipesController do
  # Says response is a 302, cassette shows a 200, unsure what is wrong
  describe "index/search" do
    it "Should return a list of recipes when given valid input" do
      VCR.use_cassette("recipes") do
        get recipe_index_path, params: { "search_terms" => "chicken" }
        must_respond_with :ok
      end
    end

    it "Should return a flash message/redirect if search returns no resultsß" do
      VCR.use_cassette("invalid_search") do
        get recipe_index_path, params: { "search_terms" => "gibberishtest" }
        expect(flash[:danger]).must_equal "There are no results for this search."
        must_respond_with 302
        must_redirect_to root_path
      end
    end
  end

  describe "Show" do
    it "Should do a flash message/redirect if given an invalid recipe show page url" do
      VCR.use_cassette("invalid_id") do
        get recipe_path(99999999)
        expect(flash[:danger]).must_equal "This recipe does not exist in our database"
        must_respond_with 302
        must_redirect_to root_path
      end
    end

    it "Can find a recipe given a valid id" do
      VCR.use_cassette("valid search") do
        get recipe_path('7bf4a371c6884d809682a72808da7dc2')
        must_respond_with :ok
      end
    end
  end


  #
  # it "Is able to load the homepage" do
  #   VCR.use_cassette("homepage") do
  #     get root_path
  #     must_respond_with :ok
  #   end
  # end
 end
