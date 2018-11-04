class Recipe

  attr_reader :name, :link, :source, :image, :ingredients, :dietary_info, :recipe_source

  def initialize(name, link, source, image, ingredients, dietary_info, recipe_source)
    raise ArgumentError if link == nil || name == ""

    @name = name
    @link = link
    @source = source
    @image = image
    @ingredients = ingredients
    @dietary_info = dietary_info
    @recipe_source = recipe_source
  end

end
