require "test_helper"

describe RecipesController do

  describe "index" do

    it "should get index" do

      VCR.use_cassette("recipes by ingredient") do
        ingredient = "broccoli"
        response = ApiMuncherWrapper.recipes_by_ingredient(ingredient)

        get recipes_path
        must_respond_with :success

      end
    end

  end

  describe "show" do

    it "will show page for valid uri" do

      VCR.use_cassette("recipe by uri") do

        uri = "ed552e2b04fbd836149044ac0e91b3fb"
        response = ApiMuncherWrapper.recipe_by_uri(uri)

        get recipe_path(uri)
        must_respond_with :success

      end
    end

    it "won't show a page with an invalid uri" do

      VCR.use_cassette("recipe by uri") do

        uri = "0"
        response = ApiMuncherWrapper.recipe_by_uri(uri)

        get recipe_path(uri)
        must_respond_with :not_found

      end
    end

  end

end
