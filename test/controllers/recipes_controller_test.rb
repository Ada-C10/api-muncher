require "test_helper"

describe RecipesController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  describe "homepage" do
    it "can get search page" do
      get root_path
       must_respond_with :success
    end
  end

  describe "index" do
    it "can get a list of recipes" do
       VCR.use_cassette("list_recipes") do
         get recipes_path, params: {query: "Pork"}
         must_respond_with :success
       end
     end
   end

   describe "show" do
     it "can get show page for a valid recipe uri" do
       VCR.use_cassette("show_recipe_detail") do
         get recipe_path("5e0a0380fcefe4cd472edb02cadd4dd7")
         must_respond_with :success
       end
     end
   end
end
