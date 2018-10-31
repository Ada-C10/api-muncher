class Recipe

  attr_reader :name, :creator, :image, :recipe_link, :ingredients, :dietary_labels


  def Initialize(name, creator, image, recipe_link, ingredients, dietary_labels = [])

    raise ArgumentError if name == nil || name == "" || id == nil || id == ""

    @name = name
    @creator = creator
    @image = image
    @recipe_link = recipe_link
    @ingredients = ingredients
    @dietary_labels = dietary_labels
  end

end
