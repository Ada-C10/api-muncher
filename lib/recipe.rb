class Recipe

  attr_reader :name, :link, :source, :image, :ingredients, :dietary_info

  def initialize(name, link, source, image, ingredients, dietary_info)
    raise ArgumentError if name == nil || name == ""

    @name = name
    @link = link
    @source = source
    @image = image
    @ingredients = ingredients
    @dietary_info = dietary_info
  end

end
