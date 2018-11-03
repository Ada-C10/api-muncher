class Recipe
  attr_reader :id, :name, :photo, :original_recipe, :ingredients, :diet_labels, :source

  def initialize(uri, name, photo, org_recipe, ingredients, diet_labels, source)
    raise ArgumentError if name == nil || name == "" || uri == nil || uri == ""

    @id = uri
    @name = name
    @photo = photo
    @original_recipe = org_recipe
    @ingredients = ingredients
    @diet_labels = diet_labels
    @source = source
  end
end
