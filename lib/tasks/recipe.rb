class Recipe

  attr_reader :name, :image

  def initialize(name, options = {})
    raise ArgumentError if name == nil || name == ""

    @name = name
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @health_labels = options[:health_labels]
  end
end
