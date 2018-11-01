require 'test_helper'

# describe Recipe do
#   it "cannot be initialized with less than 4 parameters" do
#     expect { Recipe.new }.must_raise ArgumentError
#
#     expect { Recipe.new("banana").must_raise ArgumentError
#
#     expect { Recipe.new("banana",
#       "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg")
#     }.must_raise ArgumentError
#
#     expect { Recipe.new("banana",
#       "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg",
#       "http://www.edamam.com/ontologies/edamam.owl#recipe_90689f07a89a5db81d5bdda08261b2d8")
#     }.must_raise ArgumentError
#   end
#
#   it "must initialize name, image, uri, and id properly" do
#     my_recipe = Recipe.newRecipe.new("banana",
#       "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg",
#       "http://www.edamam.com/ontologies/edamam.owl#recipe_90689f07a89a5db81d5bdda08261b2d8",
#       "90689f07a89a5db81d5bdda08261b2d8")
#
#       expect(my_recipe.name).must_equal "banana"
#       expect(my_recipe.image).must_equal "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg"
#       expect(my_recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_90689f07a89a5db81d5bdda08261b2d8"
#       expect(my_recipe.id).must_equal "90689f07a89a5db81d5bdda08261b2d8"
#
#   end
#
#   it "can be created with optional params" do
#     my_recipe = Recipe.newRecipe.new("banana",
#       "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg",
#       "http://www.edamam.com/ontologies/edamam.owl#recipe_90689f07a89a5db81d5bdda08261b2d8",
#       "90689f07a89a5db81d5bdda08261b2d8", ingredients: ["eggs", "milk", "cheese"],
#       dietary_info: ["vegan", "gluten-free"])
#
#       expect(my_recipe.name).must_equal "banana"
#       expect(my_recipe.image).must_equal "https://www.edamam.com/web-img/66a/66a0a1eebe4a4143ceccb55b68b3e574.jpg"
#       expect(my_recipe.uri).must_equal "http://www.edamam.com/ontologies/edamam.owl#recipe_90689f07a89a5db81d5bdda08261b2d8"
#       expect(my_recipe.id).must_equal "90689f07a89a5db81d5bdda08261b2d8"
#       expect(my_recipe.ingredients).must_equal ["eggs", "milk", "cheese"]
#       expect(my_recipe.dietary_info).must_equal ["vegan", "gluten-free"]
#   end
# end
