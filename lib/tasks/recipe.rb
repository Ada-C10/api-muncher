class Recipe

  attr_reader :name, :image, :id, :ingredients, :diet_labels, :health_labels

  def initialize(name, id, options = {})
    raise ArgumentError if name == nil || name == ""

    @id = id
    @name = name
    @image = options[:image]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @health_labels = options[:health_labels]
  end
end
