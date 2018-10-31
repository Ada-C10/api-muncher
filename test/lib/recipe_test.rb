require 'test_helper'

describe Recipe do

  it 'will raise an ArgumentError if created with fewer than 3 arguments' do
      expect{
        Recipe.new()
      }.must_raise ArgumentError

      expect{
        Recipe.new("Creamy Tofu Sauce Recipe")
      }.must_raise ArgumentError

      expect{
        Recipe.new("Creamy Tofu Sauce Recipe", "https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg")
      }.must_raise ArgumentError
    end

    it 'can be created with a label, image, and uri' do
      my_recipe = Recipe.new("Creamy Tofu Sauce Recipe", "https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_5c16802dd815e76ce94487b567073877")


      expect(my_recipe.label).must_equal "Creamy Tofu Sauce Recipe"
      expect(my_recipe.image).must_equal "https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg"
      expect(my_recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_5c16802dd815e76ce94487b567073877"
    end

    it 'can be created with options' do
      my_recipe = Recipe.new(
        "Creamy Tofu Sauce Recipe",
        "https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg",
        "http://www.edamam.com/ontologies/edamam.owl#recipe_5c16802dd815e76ce94487b567073877",
        {
          url: "http://www.seriouseats.com/recipes/2011/02/creamy-tofu-sauce-recipe.html",
          ingredientLines: [
            "1/4 to 1/3 large block silken or firm tofu, about 4 ounces",
            "2 teaspoons sweet, light miso, preferably Saikyo miso",
            "Pinch of salt",
            "Drop of mirin"
          ],
          healthLabels: [
            "Sugar-Conscious",
            "Vegan",
            "Vegetarian",
            "Peanut-Free",
            "Tree-Nut-Free",
            "Alcohol-Free"
          ]
        }
      )

      expect(my_recipe.label).must_equal "Creamy Tofu Sauce Recipe"
      expect(my_recipe.image).must_equal "https://www.edamam.com/web-img/d50/d5015f52972ebbf2746ae592d477dc4d.jpg"
      expect(my_recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_5c16802dd815e76ce94487b567073877"
      expect(my_recipe.id).must_equal "5c16802dd815e76ce94487b567073877"
      expect(my_recipe.url).must_equal "http://www.seriouseats.com/recipes/2011/02/creamy-tofu-sauce-recipe.html"
      expect(my_recipe.ingredientLines).must_equal [
        "1/4 to 1/3 large block silken or firm tofu, about 4 ounces",
        "2 teaspoons sweet, light miso, preferably Saikyo miso",
        "Pinch of salt",
        "Drop of mirin"
      ]
      expect(my_recipe.healthLabels).must_equal [
        "Sugar-Conscious",
        "Vegan",
        "Vegetarian",
        "Peanut-Free",
        "Tree-Nut-Free",
        "Alcohol-Free"
      ]

    end

end
