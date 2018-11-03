require 'test_helper'

  describe RecipesController do

    describe "home" do
      it "succeeds in returning the homepage" do
        get root_path

        must_respond_with :success
      end
    end

    describe "index" do
      it "succeeds when there has been no user search" do
        get recipes_path

        must_respond_with :success
      end

      it "succeeds in with valid search params" do

        VCR.use_cassette('controller_search') do
          get recipes_path, params: {user_search: 'muffin', health_labels: [0,0,0,0]}

          must_respond_with :success
        end
      end

      it "succeeds when given a bad search term" do

        VCR.use_cassette('bogus_controller_search') do
          get recipes_path, params: {user_search: '30895sldflaj', health_labels: [0,0,0,0]}

          must_respond_with :success
        end
      end
    end

    describe "show" do
      it "returns the show page with a single recipe" do
        VCR.use_cassette('show_recipe') do
          get recipe_path("0ff11a2807e1d4d99bdb33de5d2fd9bd")

          must_respond_with :success
        end

      end

      it "returns 404 when the recipe cannot be not found" do
        VCR.use_cassette('show_recipe') do
          get recipe_path("2085lkfklastuffstuff")

          must_respond_with :not_found
        end
      end

    end
end
