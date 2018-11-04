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

    it 'redirects to Recipes#index if the user enters something in the search field' do
      food_type = {
        food_type: "apple"
      }

      post find_path, params: food_type

      must_redirect_to recipes_path([:apple])

    end
  end
  
end
