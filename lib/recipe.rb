class Recipe
  attr_reader :name, :image, :uri, :id, :ingredients, :dietary_info, :recipe_link

  def initialize(name, image, uri, options = {} )
    raise ArgumentError if name == nil || name == "" || image == nil || image == "" || uri == nil || uri == ""

    @name = name
    @image = image
    @uri = uri
    @id = uri.split("_").last

    @ingredients = options[:ingredients]
    @dietary_info = options[:dietary_info]
    @recipe_link = options[:recipe_link]
  end
end
