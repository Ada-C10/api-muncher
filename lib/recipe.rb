class Recipe
  attr_reader :label, :uri, :image, :url, :ingredients, :health

  def initialize(label, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.split("recipe_").last

    @image = options[:image]
    @url = options[:url]
    @ingredients = options[:ingredients]
    @health = options[:health]
  end

end
