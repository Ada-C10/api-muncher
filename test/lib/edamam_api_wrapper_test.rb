require 'test_helper'

describe EdamamApiWrapper do

  describe "EdamamApiWrapper#self.search_recipes(food)" do

    it "returns a list of recipes" do
      VCR.use_cassette("recipes") do
        food = "test food"
        response = EdamamApiWrapper.search_recipes(food)

        expect(response.length).must_be :>, 0

        response.each do |recipe|
          expect(recipe).must_respond_to :uri
          expect(recipe).must_respond_to :name
        end

      end
    end

  end

  describe "EdamamApiWrapper#self.create_recipe(api_params)" do
    it "creates and returns instance of Recipe" do
      VCR.use_cassette("recipe") do
        api_params = {
          uri: "randomuri1234",
          name: "test food title",
          creator: "test creator",
          image: "random_image_url",
          recipe_link: "random_recipe_url",
          ingredients: ["ingredient", "ingredient"],
          dietary_labels: ["label", "label"]
        }

       recipe =  Recipe.new(api_params)

       assert_instance_of(Recipe, recipe)
       expect(recipe.uri).must_equal api_params[:uri]
       expect(recipe.name).must_equal api_params[:name]
       expect(recipe.creator).must_equal api_params[:creator]
       expect(recipe.image).must_equal api_params[:image]
       expect(recipe.recipe_link).must_equal api_params[:recipe_link]
       expect(recipe.ingredients).must_equal api_params[:ingredients]
       expect(recipe.dietary_labels).must_equal api_params[:dietary_labels]
      end
    end

    it "can't create instace of Recipe given invalid parameters" do
      VCR.use_cassette("recipe") do

        # params with uri missing
        api_params = {
          name: "test food title",
          creator: "test creator",
          image: "random_image_url",
          recipe_link: "random_recipe_url",
          ingredients: ["ingredient", "ingredient"],
          dietary_labels: ["label", "label"]
        }

       expect{Recipe.new(api_params)}.must_raise ArgumentError
    end
  end

  end

  describe "EdamamApiWrapper#self.find_recipe(uri)" do
    it "returns a recipe given a uri" do
      VCR.use_cassette("found_recipe") do
        uri = "7bf4a371c6884d809682a72808da7dc2"

        assert_instance_of(Recipe, EdamamApiWrapper.find_recipe(uri))
      end
    end

    it "can't return a recipe given an invalid uri" do
      VCR.use_cassette("found_recipe") do
        uri = "test_uri"
        
        expect{EdamamApiWrapper.find_recipe(uri)}.must_be false
      end
    end

  end

end
