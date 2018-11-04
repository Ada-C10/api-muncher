require "test_helper"

describe RecipesController do
  describe "finder" do
    it 'informs user of mistake if an empty search string is submitted' do
      food_type = {
        food_type: ""
      }

      post find_path, params: food_type
      expect(flash[:error]).must_equal "Ooops. Looks like you forgot to enter a food type. Please try again."
    end

    it 'redirects to Recipes#index if the user enters something in the search entry' do
      food_type = {
        food_type: "apple"
      }

      post find_path, params: food_type

      must_redirect_to recipes_path([:apple])

    end
  end
  describe "index" do
    it 'resonds with success with a valid search entry' do

      VCR.use_cassette("recipes") do
        get recipes_path([:apple])
        must_respond_with :success
      end
    end

    it 'flashes an error with an invalid search entry' do
      VCR.use_cassette("recipes") do

        get recipes_path([:/])

        expect(flash[:error]).must_equal "Ooops. Looks like there are no recipes for '/'. Please try again."
        must_respond_with :redirect
      end
    end
  end

  describe 'show' do
    it 'shows a specific recipe' do
      VCR.use_cassette("recipes") do
        id = {
          id: "recipe_b79327d05b8e5b838ad6cfd9576b30b6"
        }
        get recipe_path(id)
        must_respond_with :success
      end
    end

  end
end
