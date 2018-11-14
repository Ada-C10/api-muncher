require "test_helper"

describe RecipesController do
  let (:uri) {"a53ef6c8495adcb9f2859b1e5d99e9ba"}

  describe "index" do

    it "should get index" do
      VCR.use_cassette('search_list') do

        get root_path

        must_respond_with :ok
      end
    end

  end #index end
  #
  describe "show" do

    it "should get show page" do
      VCR.use_cassette('single_recipe') do

        get recipe_show_path(uri)

        must_respond_with :ok
      end
    end

  end #show end


end
