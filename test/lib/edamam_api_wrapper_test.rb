require "test_helper"

describe EdamamApiWrapper do

  it 'can return list recipes' do
    VCR.use_cassette('recipe_list') do
      recipe_list = EdamamApiWrapper.list_recipes("chicken")

      expect(recipe_list.length).must_be :>, 0
      recipe_list.each do |recipe|
        expect(recipe).must_be_instance_of Recipe
      end
    end
  end
  #
  # it "returning nil when the network is unavailable" do
  #   VCR.use_cassette('network_error') do
  #
  #     expect{
  #       network_error = EdamamApiWrapper.list_recipes("chicken")
  #     }.must_raise SocketError
  #
  #   end
  # end

  it 'will return a single recipe' do
    VCR.use_cassette('single_recipe') do
      single_recipe = EdamamApiWrapper.find_recipe("460c55360ede96cf3afca927baefd1de")

      expect(single_recipe).must_be_instance_of Recipe
    end
  end

  it 'will return a instance of Recipe with all params' do

    single_recipe = EdamamApiWrapper.recipe_hits({
      "label" => "chicken soup",
      'uri'=> "46382939383",
      "ingredientsLines" => "chicken,broth,carrots",
      "healthLabels" => "gluten free",
      "image" => "image",
      "url" => "www.google.com"
      })

      expect(single_recipe).must_be_instance_of Recipe
    end

    it 'will return an empty array if query is blank' do
      VCR.use_cassette('empty_search_list') do
        recipe_list = EdamamApiWrapper.list_recipes("")

        expect(recipe_list.length).must_equal 0
        recipe_list.each do |recipe|
          expect(recipe).must_be_instance_of Recipe
        end
      end
    end


end
