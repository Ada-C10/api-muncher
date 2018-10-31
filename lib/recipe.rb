class Recipe
  attr_reader :name, :image, :uri, :id, :ingredients, :dietary_info

  def initialize(name, image, uri, options = {} )
    raise ArgumentError if name == nil || name == ""

    @name = name
    @image = image
    @uri = uri
    @id = uri.split("_").last

    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
  end
end
