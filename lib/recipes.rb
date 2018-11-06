class Recipes
  attr_reader :title, :recipe_id, :photo, :ingredients, :servings, :source, :diet, :restrictions, :calorie_count, :prep_time

  def initialize(label, recipe_id, image, ingredients, servings, source, diet_label, health_label, calories, total_time)
    raise ArgumentError if label == nil || label == "" || recipe_id == nil || recipe_id == ""

    @title = label
    @recipe_id = recipe_id
    @photo = image
    @ingredients = ingredients
    @servings = servings
    @source = source
    @diet = diet_label
    @restrictions = health_label
    @calorie_count = calories
    @prep_time = total_time
  end

end #class end
