class Recipe

  attr_reader :name, :ingredients, :dietary_info

  def initialize(name, ingredients = [], options = {} )
    raise ArgumentError if name == nil || name == ""

    @name = name
    @ingredients = options[:ingredients]
    @uri = options[:uri]
    @dietary_info = options[:dietary_info]
    @image_url = options[:image_url]
    @health_info = options[:health_info]
  end
end
