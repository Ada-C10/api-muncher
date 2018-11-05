require "test_helper"

describe RecipesController do
  describe "index" do

    it "should get index" do
      VCR.use_cassette('search_list') do

        get recipes_index_path

        must_respond_with :ok
      end
    end

  end #index end

  describe "show" do

    it "should get show page" do
      VCR.use_cassette('single_recipe') do

        get recipe_show_path(uri)

        must_respond_with :success
      end
    end

  end #show end

  
end
