class Recipe
  attr_reader :title, :image, :uri, :ingredients, :url, :source, :diet_labels, :health_labels, :calories

  def initialize(recipe_hash)
    @title = recipe_hash["label"]
    @image = recipe_hash["image"]
    @uri = recipe_hash["uri"]
    @ingredients = recipe_hash["ingredientLines"]
    @url = recipe_hash["url"]
    @source = recipe_hash["source"]
    @diet_labels = recipe_hash["dietLabels"]
    @health_labels = recipe_hash["healthLabels"]
    @calories = recipe_hash["calories"]
  end
end
