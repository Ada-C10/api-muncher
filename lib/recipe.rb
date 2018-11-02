class Recipe
  attr_reader :id, :name, :photo, :original_recipe, :ingredients, :nutrition

  def initialize(id, name, photo, org_recipe, ingredients, nutrition)
    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @id = id
    @name = name
    @photo = photo
    @original_recipe = org_recipe
    @ingredients = ingredients
    @nutrition = nutrition
  end
end
