require "test_helper"

describe RecipesController do
  describe "index " do
    it "should respond to success if params is valid" do
      VCR.use_cassette("recipes") do
        get recipes_index_path(params: {recipes: "cookie"})

        must_respond_with :success
      end
    end

    it "should redirect if params is empty or invalid" do
      VCR.use_cassette("recipes") do
        get recipes_index_path(params: {recipes: ""})

        must_redirect_to root_path
      end
    end

    it "is able to flashes error msg if params is empty" do
      # invalid params is handled in the index method
      VCR.use_cassette("recipes") do
        get recipes_index_path(params: {recipes: ""})

        must_respond_with :redirect
        expect(flash[:error]).must_equal "Could not find recipes. Try again."
      end
    end
  end

  describe "search" do
    it "is able to show root page" do
      VCR.use_cassette("recipes") do
        get root_path

        must_respond_with :success
      end
    end

    it "must redirect to index page with params data" do
      VCR.use_cassette("recipes") do
        get root_path(params: {recipes: "cookie"})

        must_redirect_to recipes_index_path("cookie")
      end
    end
  end

  describe "show" do
    it "should show specific recipe if params is valid" do
      VCR.use_cassette("recipes") do
        # binding.pry
        get recipe_show_path(recipe: "115b7da63f48e228cfdbf88e0e0a338a")

        must_respond_with :success
      end
    end

    it "should redirect if params is empty or invalid" do
      VCR.use_cassette("recipes") do
        # binding.pry
        get recipe_show_path(recipe: "asdf")

        must_redirect_to root_path
        expect(flash[:error]).must_equal "Could not find that particular recipe. Try again."
      end
    end
  end
end
