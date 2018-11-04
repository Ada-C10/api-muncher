require 'test_helper'

describe Recipe do
  describe 'initialize' do
    it "raises an error if required params are not there" do

      expect {
        Recipe.new()
      }.must_raise ArgumentError

    end

    it "assigns an instance of a new recipe initialization with valid params" do
      label = "some label"
      uri = "some uri"
      image = "some_image.jpg"
      url = "some url"
      dietLabels = ["some labels"]
      healthLabels = ["some more labels"]
      ingredientLines = ["some ingredients", "and more"]

      recipe = Recipe.new(label, uri, image, url, dietLabels, healthLabels, ingredientLines)

      expect(recipe.label).wont_be_nil
      expect(recipe.label).must_equal "some label"

      expect(recipe.uri).wont_be_nil
      expect(recipe.uri).must_equal "some uri"

      expect(recipe.image).wont_be_nil
      expect(recipe.image).must_equal "some_image.jpg"

      expect(recipe.url).wont_be_nil
      expect(recipe.url).must_equal "some url"

      expect(recipe.dietLabels).wont_be_nil
      expect(recipe.dietLabels).must_equal ["some labels"]

      expect(recipe.healthLabels).wont_be_nil
      expect(recipe.healthLabels).must_equal ["some more labels"]

      expect(recipe.ingredientLines).wont_be_nil
      expect(recipe.ingredientLines).must_equal ["some ingredients", "and more"]
    end
  end
end
