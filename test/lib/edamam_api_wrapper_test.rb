require 'test_helper'

describe "Edamam Api Wrapper" do

   before do
     # Had to do ||= or minitest was upset about repeated constants
     BASE_URL ||= 'https://api.edamam.com/search'
     TOKEN ||= ENV['EDAMAM_TOKEN']
     ID ||= ENV['EDAMAM_ID']
   end

   describe "search" do

     it "Can return a list of recipes with a valid input" do
       # Test EdamamApiWrapper.list_recipes here
       VCR.use_cassette("recipes") do
         search_terms = "chicken"
         url = "#{BASE_URL}?&app_id=#{ID}&app_key=#{TOKEN}&q=#{search_terms}"
         data = HTTParty.get(url)
         response = EdamamApiWrapper.list_recipes("chicken")
         data.response.code.to_i.must_equal 200
         data["q"].must_equal "chicken"
       end
     end

     it "Returns an empty array when no results are returned" do
       VCR.use_cassette("invalid_search") do
         search_terms = "gibberishtest"
         url = "#{BASE_URL}?&app_id=#{ID}&app_key=#{TOKEN}&q=#{search_terms}"
         data = HTTParty.get(url)
         response = EdamamApiWrapper.list_recipes("gibberishtest")
         data.code.to_i.must_equal 200
         expect(response.length).must_equal 0
       end
     end
   end

   describe "show" do

     it "Can return a recipe when given a valid uri" do
       VCR.use_cassette("recipe") do
         id = "b79327d05b8e5b838ad6cfd9576b30b6"
         url = "#{BASE_URL}?app_id=#{ID}&app_key=#{TOKEN}&to=50&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}"
         # Send the request
         data = HTTParty.get(url).parsed_response
         response = EdamamApiWrapper.list_recipe("b79327d05b8e5b838ad6cfd9576b30b6")
         expect(response.length).must_equal 1
         # Can't find response code in data or response
         # response["ok"].must_equal true
         # reponse["error"].wont_be_nil
       end
     end

     it "returns nothing if given an invalid show page url" do
       VCR.use_cassette("invalid id") do
         id = "-1"
         url = "#{BASE_URL}?app_id=#{ID}&app_key=#{TOKEN}&r=http://www.edamam.com/ontologies/edamam.owl%23recipe_#{id}"
         # Send the request
         data = HTTParty.get(url).parsed_response
         response = EdamamApiWrapper.list_recipe(id)
         expect(response.length).must_equal 0

         # Can't find response code in data or response
       end
     end
   end
   #
   # Could not figure out how to record the home page 
   # describe "root path" do
   #
   #   it "Can load the home page" do
   #     VCR.use_cassette("homepage") do
   #        data = HTTParty.get(root_path).parsed_response
   #     end
   #   end
   #
   # end

end
