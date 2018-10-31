class Recipe
  attr_reader :name, :image, :uri :ingredients, :dietary_info

  def initialize(name, image, uri options = {} )
    raise ArgumentError if label == nil || label == ""

    @name = name
    @image = image
    @uri = uri

    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
  end
end
