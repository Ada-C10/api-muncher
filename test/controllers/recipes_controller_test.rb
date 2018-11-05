require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  describe "search" do

    it "can get search page" do
      get root_path
      must_respond_with :success
    end
    
  end


end
